if (!require("dplyr")) install.packages("dplyr")
library(dplyr)

if (!require("tidyr")) install.packages("tidyr")
library(tidyr)

if (!require("lubridate")) install.packages("lubridate")
library(lubridate)

if (!require("stringr")) install.packages("stringr")
library(stringr)

taiwan_env <- base::new.env()
base::load("output/taiwan_env.RData", envir = taiwan_env)

taiwan_env$fdi_tidy <- taiwan_env$fdi_case_study |>
  dplyr::slice(-1:-2) |>
  dplyr::rename_with(~ stringr::str_replace_all(.x, fixed("...", ), "Y")) |>
  dplyr::rename("Sector" = "Complete View of Data") |>
  tidyr::pivot_longer(cols = dplyr::starts_with("Y"), names_to = "Year", values_to = "FDI") |>
  dplyr::mutate(Year = readr::parse_number(Year), FDI = readr::parse_number(FDI))

taiwan_env$salary_tidy <- taiwan_env$salary |>
  dplyr::mutate(workclass = base::as.factor(workclass), education = base::as.factor(education), occupation = base::as.factor(occupation), salary_binary = dplyr::if_else(salary == ">50K", 1L, 0L))

taiwan_env$residence_tidy <- taiwan_env$residence_data |>
  dplyr::mutate(Period = lubridate::ym(Period)) |>
  dplyr::arrange(Residence, Period)

taiwan_env$twii_tidy <- taiwan_env$twii |>
  dplyr::mutate(dplyr::across(
    c(Open, High, Low, Close, `Adj Close`, Volume),
    ~ base::as.numeric(base::gsub("[^0-9.]", "", .x))
  )) |>
  tidyr::pivot_longer(
    cols = c(Open, High, Low, Close, `Adj Close`),
    names_to = "metric",
    values_to = "value"
  )

taiwan_env$tsm_tidy <- taiwan_env$tsm_stock |>
  dplyr::mutate(date = lubridate::as_datetime(date))

taiwan_env$asia_trade_tidy <- taiwan_env$asia_trade |>
  tidyr::pivot_longer(cols = tidyselect::matches("GROSS WEIGHT|NET WEIGHT"), names_to = "weight_type", values_to = "weight_kg") |>
  dplyr::mutate(DATE = readr::parse_date(DATE, format = "%d-%b-%Y"))

taiwan_env$corp_clean <- taiwan_env$corporate_actions |>
  dplyr::rename_with(base::make.names) |>
  dplyr::select(dplyr::contains("Date"), dplyr::contains("Type"), dplyr::contains("Volume"), dplyr::everything()) |>
  dplyr::mutate(dplyr::across(dplyr::contains("Date"), base::as.Date))

taiwan_env$cpi_df <- taiwan_env$cpi_taiwan

taiwan_env$gdp_df <- dplyr::rename(taiwan_env$gdp_taiwan, Year = `...1`)

taiwan_env$demo_df <- dplyr::rename(taiwan_env$democracy_index, Democracy = `Democracy score`)

taiwan_env$tsi_tidy <- taiwan_env$taiwan_stock_index |>
  dplyr::rename(Price = `Price Index`) |>
  dplyr::mutate(Date = lubridate::ymd(Date))

base::save(envir = taiwan_env, list = base::ls(envir = taiwan_env), file = "output/taiwan_env.RData")
