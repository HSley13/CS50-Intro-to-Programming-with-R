if (!require("readxl")) install.packages("readxl")
library(readxl)

if (!require("readr")) install.packages("readr")
library(readr)

fdi_case_study <- readr::read_csv("FDI Case Study.csv", n_max = 84 - 15)
fdi_case_study

salary <- readr::read_csv("Salary.csv")
salary

residence_data <- readr::read_csv("Residence Data.csv")
residence_data

twii <- readr::read_csv("TWII.csv")
twii

asia_import_export_trade_data <- readr::read_csv("Asia Import Export Trade Data.csv")
asia_import_export_trade_data

corporate_acitons_market_data_taiwan <- readxl::read_excel("Corporate Actions Market Data Taiwan.xlsx")
corporate_acitons_market_data_taiwan

cpi_taiwan_2001 <- readr::read_csv("CPI Taiwan 2001 - 2020.csv")
cpi_taiwan_2001

democracy_index_eiu <- readr::read_csv("democracy-index-eiu.csv")
democracy_index_eiu

fdi_and_inovation_data <- readxl::read_excel("FDI and Innovation data.xlsx")
fdi_and_inovation_data

gdp_taiwan_2001 <- readr::read_csv("GDP Taiwan 2001 - 2020.csv")
gdp_taiwan_2001

import_export_trade_data_asia <- readr::read_csv("ImportExport Trade data Asia.csv")
import_export_trade_data_asia

taiwan_capitalization_weighted_stock_index_2009 <- readxl::read_excel("Taiwan Capitalization Weighted Stock Index 2009 - 2021.xls")
taiwan_capitalization_weighted_stock_index_2009

tsm_1997_10_08_2025_04_22 <- readr::read_csv("TSM_1997-10-08_2025-04-22.csv")
tsm_1997_10_08_2025_04_22
