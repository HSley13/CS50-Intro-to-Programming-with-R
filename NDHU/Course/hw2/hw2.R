# Load required libraries
if (!require(rvest)) install.packages("rvest", dependencies = TRUE)
if (!require(ggplot2)) install.packages("ggplot2", dependencies = TRUE)
library(rvest)
library(ggplot2)

# -------------------------------
# Scrape TSMC Cash Dividend Data
# -------------------------------
scrape_tsmc_dividends <- function(url = "https://tw.stock.yahoo.com/d/s/dividend_2330.html") {
  # Read HTML content
  page <- read_html(url)

  # Extract the dividend table rows
  table_nodes <- html_nodes(page, "table") # Get all tables
  dividend_table <- html_table(table_nodes[[1]], fill = TRUE) # Use first table (known layout)

  # Check if the table was correctly extracted
  if (is.null(dividend_table) || nrow(dividend_table) == 0) {
    stop("Dividend table not found or is empty.")

  # Extract cash dividend column (usually column 2 or 3 depending on layout)
  colnames(dividend_table) <- make.names(colnames(dividend_table)) # Clean column names

  # Identify the correct column name
  cash_col_name <- grep("現金股利", colnames(dividend_table), value = TRUE)

  if (length(cash_col_name) == 0) stop("Couldn't find cash dividend column.")

  # Convert to numeric and remove NA/invalid values
  cash_dividends <- as.numeric(dividend_table[[cash_col_name]])
  cash_dividends <- cash_dividends[!is.na(cash_dividends)]

  # -------------------------------
  # Results and Visualization
  # -------------------------------

  # Print average
  avg_dividend <- mean(cash_dividends)
  cat("=== 台積電 (2330) 現金股利分析 ===\n")
  cat("總筆數:", length(cash_dividends), "\n")
  cat("平均現金股利:", round(avg_dividend, 2), "元\n\n")

  # Prepare data frame for plotting
  df <- data.frame(
    Year = seq_along(cash_dividends),
    Dividend = cash_dividends
  )

  # Plot using ggplot2
  p <- ggplot(df, aes(x = factor(Year), y = Dividend)) +
    geom_bar(stat = "identity", fill = "#4CAF50") +
    labs(
      title = "台積電現金股利分布圖",
      x = "年分 (由近至遠排序)",
      y = "現金股利（元）"
    ) +
    theme_minimal(base_size = 14)

  return(p)
}

p <- scrape_tsmc_dividends()

