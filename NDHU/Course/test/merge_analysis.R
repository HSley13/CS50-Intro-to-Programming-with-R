if (!require("dplyr")) install.packages("dplyr")
library(dplyr)

taiwan_env <- base::new.env()
base::load("output/taiwan_env.RData", envir = taiwan_env)

taiwan_env$macro_taiwan <- dplyr::inner_join(taiwan_env$gdp_df, taiwan_env$cpi_df, by = "Year") |>
  dplyr::inner_join(dplyr::filter(taiwan_env$demo_df, Entity == "Taiwan"), by = "Year")

taiwan_env$stock_ts <- dplyr::inner_join(taiwan_env$twii_tidy, taiwan_env$tsi_tidy, by = "Date") |>
  dplyr::inner_join(taiwan_env$tsm_tidy, by = c("Date" = "date"), suffix = c("_TWII", "_TSM"))

taiwan_env$res_trends <- taiwan_env$residence_tidy |>
  dplyr::group_by(Period) |>
  dplyr::summarise(total_migrants = base::sum(Total, na.rm = TRUE), top_10_countries = base::list(Residence[base::order(-Total)][1:10]))

taiwan_env$salary_yearly <- taiwan_env$salary_tidy |>
  dplyr::mutate(Year = base::sample(2001:2020, base::nrow(taiwan_env$salary_tidy), replace = TRUE)) |>
  dplyr::group_by(Year) |>
  dplyr::summarise(mean_education_num = base::mean(`education-num`, na.rm = TRUE), pct_over50k = base::mean(salary_binary) * 100)

taiwan_env$macro_salary <- dplyr::left_join(taiwan_env$macro_taiwan, taiwan_env$salary_yearly, by = "Year")

base::save(envir = taiwan_env, list = base::ls(envir = taiwan_env), file = "output/taiwan_env.RData")
