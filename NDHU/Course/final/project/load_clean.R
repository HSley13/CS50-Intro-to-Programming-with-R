if (!require(tidyverse)) install.packages("tidyverse")
library(tidyverse)

if (!require(shiny)) install.packages("shiny")
library(shiny)

# ==== DATA LOADING & CLEANING =====================================

# Helper function to read and clean CSV files
read_clean_csv <- function(path, ...) {
  readr::read_csv(path, show_col_types = FALSE, ...) |>
    janitor::clean_names()
}

# 1. Taiwan Macroeconomic Data
gdp_tw <- read_clean_csv("data/GDP Taiwan 2001 - 2020.csv") |>
  dplyr::rename(year_raw = 1) |>
  dplyr::rename_with(~ c("gdp_nt_mn", "gdp_pc_nt"), .cols = 2:3) |>
  dplyr::mutate(
    year = if (is.numeric(year_raw)) year_raw else readr::parse_number(year_raw),
    gdp_usd_bn = gdp_nt_mn / 30 / 1e3 # Convert NT$ million → US$ billion
  ) |>
  dplyr::select(year, gdp_usd_bn)

cpi_tw <- read_clean_csv("data/CPI Taiwan 2001 - 2020.csv") |>
  dplyr::select(year, cpi_non_seasonal_adjusted) |>
  dplyr::rename(cpi_nsadj = cpi_non_seasonal_adjusted)

macro_tw <- dplyr::left_join(gdp_tw, cpi_tw, by = "year")

# 2. World GDP Data
gdp_world_long <- read_clean_csv("data/gdp_csv.csv") |>
  dplyr::rename(country = country_name, gdp_usd = value) |>
  dplyr::mutate(
    country = stringr::str_trim(country),
    gdp_usd_bn = as.numeric(gdp_usd) / 1e9
  ) |>
  dplyr::select(country, year, gdp_usd_bn) |>
  tidyr::drop_na(gdp_usd_bn)

# 3. Democracy Index Data
democracy <- read_clean_csv("data/democracy-index-eiu.csv") |>
  dplyr::rename(country = entity, demo_score = democracy_score) |>
  dplyr::mutate(country = stringr::str_trim(country))

years_all <- range(democracy$year, na.rm = TRUE)

# 4. Stock Market Data
clean_stock <- function(path, ticker, skip = 0, col_names = NULL) {
  df <- if (is.null(col_names)) {
    readr::read_csv(path, skip = skip, show_col_types = FALSE) |>
      janitor::clean_names()
  } else {
    readr::read_csv(path, skip = skip, col_names = col_names, show_col_types = FALSE)
  }

  date_col <- names(df)[stringr::str_detect(names(df), "^date|timestamp")][1]
  price_col <- names(df)[stringr::str_detect(names(df), "^adj.*close|adjusted_close|adjclose")][1]
  if (is.na(price_col)) price_col <- names(df)[stringr::str_detect(names(df), "^close$|price")][1]

  df |>
    dplyr::mutate(
      date = lubridate::as_date(.data[[date_col]]),
      adj_close = as.numeric(.data[[price_col]]),
      company = ticker
    ) |>
    dplyr::select(date, adj_close, company) |>
    tidyr::drop_na(adj_close)
}

tsmc <- clean_stock("data/TSM_1997-10-08_2025-04-22.csv", "TSMC")
apple <- clean_stock("data/AAPL.csv", "Apple")
msft <- clean_stock("data/MSFT_1986-03-13_2025-02-04.csv", "Microsoft")
tsla <- clean_stock("data/TSLA.csv", "Tesla")
nvda <- clean_stock("data/NVIDIA_STOCK.csv", "NVIDIA",
  skip = 3,
  col_names = c(
    "date", "adj_close", "close",
    "high", "low", "open", "volume"
  )
)

stocks_all <- dplyr::bind_rows(tsmc, apple, msft, tsla, nvda)
stock_min <- min(stocks_all$date)
stock_max <- max(stocks_all$date)

# 5. Foreign Visitor Data
purpose_long <- read_clean_csv("data/Purpose Data.csv") |>
  dplyr::mutate(
    period = lubridate::ym(period),
    year = lubridate::year(period),
    residence = stringr::str_trim(residence)
  ) |>
  tidyr::pivot_longer(-c(residence, region, sub_region, period, year),
    names_to = "purpose", values_to = "count"
  )

residence_tidy <- read_clean_csv("data/Residence Data.csv") |>
  dplyr::mutate(
    period = lubridate::ym(period),
    year = lubridate::year(period),
    residence = stringr::str_trim(residence)
  ) |>
  dplyr::select(residence, region, sub_region, period, year, total)

# 6. Salary Data
salary_raw <- read_clean_csv("data/salary.csv") |>
  dplyr::mutate(across(c(native_country, salary), stringr::str_trim))

salary_numeric_vars <- c(
  "age", "fnlwgt", "education_num",
  "capital_gain", "capital_loss", "hours_per_week"
)
salary_country_choices <- sort(unique(salary_raw$native_country))
