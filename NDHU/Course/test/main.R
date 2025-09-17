source("load_data.R") source("clean_transform.R") source("merge_analysis.R")
if (!require("plotly")) install.packages("plotly")
library(plotly)

if (!require("ggplot2")) install.packages("ggplot2")
library(ggplot2)

if (!require("dplyr")) install.packages("dplyr")
library(dplyr)

taiwan_env <- base::new.env()
base::load("output/taiwan_env.RData", envir = taiwan_env)

macro <- taiwan_env$macro_taiwan
macro_salary <- taiwan_env$macro_salary
fdi_inno <- taiwan_env$fdi_inno_tw
trade <- taiwan_env$asia_trade_tidy
stocks <- taiwan_env$stock_ts
demo <- taiwan_env$demo_df
res_trends <- taiwan_env$res_trends
salary_yearly <- taiwan_env$salary_yearly

col_starts_with <- function(df, prefix) {
  colname <- names(df)[startsWith(names(df), prefix)][1]
  df[[colname]]
}

## GDP & CPI over time
p1 <- ggplot2::ggplot(macro, ggplot2::aes(x = Year)) +
  ggplot2::geom_line(ggplot2::aes(y = col_starts_with(macro, "GDP")), color = "blue") +
  ggplot2::geom_line(ggplot2::aes(y = col_starts_with(macro, "CPI") * 1e5), color = "red") +
  ggplot2::scale_y_continuous(name = "GDP", sec.axis = ggplot2::sec_axis(~ . / 1e5, name = "CPI")) +
  ggplot2::theme_bw()
plotly::ggplotly(p1)

## GDP vs %>50K Income
p2 <- ggplot2::ggplot(macro_salary, ggplot2::aes(x = col_starts_with(macro_salary, "GDP"), y = pct_over50k)) +
  ggplot2::geom_point() +
  ggplot2::geom_smooth(method = "lm") +
  ggplot2::labs(title = "GDP vs % earning >50K") +
  ggplot2::theme_bw()
plotly::ggplotly(p2)

## FDI & Innovation Trend
p3 <- ggplot2::ggplot(fdi_inno, ggplot2::aes(x = Year)) +
  ggplot2::geom_line(ggplot2::aes(y = `Innovative Index`), color = "green") +
  ggplot2::geom_line(ggplot2::aes(y = `FDI value` / 1e9), color = "purple") +
  ggplot2::scale_y_continuous(sec.axis = ggplot2::sec_axis(~ . * 1e9, name = "FDI (USD)")) +
  ggplot2::labs(title = "Taiwan Innovation & FDI Over Time") +
  ggplot2::theme_bw()
plotly::ggplotly(p3)


## Top traded goods by weight
wnd <- trade %>%
  dplyr::group_by(weight_type) %>%
  dplyr::summarise(weight = sum(weight_kg, na.rm = TRUE)) %>%
  dplyr::arrange(-weight) %>%
  dplyr::slice_head(n = 10)
p4 <- ggplot2::ggplot(wnd, ggplot2::aes(x = reorder(weight_type, weight), y = weight)) +
  ggplot2::geom_col(fill = "steelblue") +
  ggplot2::coord_flip() +
  ggplot2::theme_bw()
plotly::ggplotly(p4)

## Taiwan Stock Index vs TSMC
p5 <- ggplot2::ggplot(stocks, ggplot2::aes(x = Date)) +
  ggplot2::geom_line(ggplot2::aes(y = value), color = "navy") +
  ggplot2::facet_wrap(~metric, scales = "free_y", ncol = 1) +
  ggplot2::labs(title = "TWII & TSM Market Metrics over Time") +
  ggplot2::theme_bw()
plotly::ggplotly(p5)


# Taiwan Score Over Time
p6 <- ggplot2::ggplot(demo %>% dplyr::filter(Entity == "Taiwan"), ggplot2::aes(x = Year, y = Democracy)) +
  ggplot2::geom_line(color = "darkgreen") +
  ggplot2::labs(title = "Taiwan’s Democracy Index Over Time") +
  ggplot2::theme_bw()
plotly::ggplotly(p6)

# Compare with China
ch <- demo %>% dplyr::filter(Entity %in% c("Taiwan", "China"))
p7 <- ggplot2::ggplot(ch, ggplot2::aes(x = Year, y = Democracy, color = Entity)) +
  ggplot2::geom_line() +
  ggplot2::labs(title = "Democracy: Taiwan vs China") +
  ggplot2::theme_bw()
plotly::ggplotly(p7)


# Migration over Time (interactive)
library(plotly)
mig <- res_trends %>% tidyr::unnest(top_10_countries)
fig <- plotly::plot_ly(mig, x = ~Period, y = ~total_migrants, type = "scatter", mode = "lines")

# Salary per year
sal <- salary_yearly
p8 <- ggplot2::ggplot(sal, ggplot2::aes(x = Year, y = mean_education_num, size = pct_over50k)) +
  ggplot2::geom_point(color = "darkorange", alpha = 0.7) +
  ggplot2::labs(title = "Education vs. High Income % Over Time") +
  ggplot2::theme_bw()
plotly::ggplotly(p8)
