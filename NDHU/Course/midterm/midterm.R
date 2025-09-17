# ------------------------------
# Question 1 (40%)
# ------------------------------

# 1-1. Create a vector for weekly TAIEX changes
taiex_weekly_change <- base::c(300, 500, -560, 250, -128)
base::names(taiex_weekly_change) <- base::c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
base::print(taiex_weekly_change)

# 1-2. Create a matrix for TAIEX volumes for last week and this week
taiex_volumes <- base::matrix(base::c(1000, 800), nrow = 1, byrow = TRUE)
base::colnames(taiex_volumes) <- base::c("Last_Week", "This_Week")
base::rownames(taiex_volumes) <- base::c("TAIEX_Total")
base::print(taiex_volumes)

# 1-3. Create a data frame for stock market commentary
market_commentary <- base::data.frame(
  Market_Analysis = base::c("Strong rebound", "Bullish outlook", "Volatile at high", "New high"),
  Operation_Advice = base::c("Buy and hold", "Sell small for profit", "Observe only", "Increase holdings"),
  Source = base::c("GuruStock", "StockGo", "ChaoStock", "MarketWave")
)
base::print(market_commentary)

# ------------------------------
# Question 2 (10%)
# ------------------------------

# Create a list containing the three objects from Question 1
taiex_summary <- base::list(
  Weekly_Change = taiex_weekly_change,
  Volume_Two_Weeks = taiex_volumes,
  Commentary = market_commentary
)
base::print(taiex_summary)

# ------------------------------
# Question 3 (10%)
# ------------------------------

# Add a new string to the list: "Provided by StockTalk"
data_provider <- "StockTalk"
taiex_summary$Data_Provider <- data_provider
base::print(taiex_summary)

# ------------------------------
# Question 4 (10%)
# ------------------------------

# Analyze a numeric vector for values compared to 24
analyze_24 <- function(numbers) {
  pos <- base::which(numbers == 24)
  count_greater <- base::sum(numbers > 24)
  count_less <- base::sum(numbers < 24)
  base::cat("Position(s) of 24 in the data:", base::ifelse(base::length(pos) == 0, 0, base::paste(pos, collapse = ", ")), "\n")
  base::cat("Count of numbers greater than 24:", count_greater, "\n")
  base::cat("Count of numbers less than 24:", count_less, "\n")
  base::cat("\n")
}

# Examples:
analyze_24(base::c(10, 24, 5, 30, 1))
analyze_24(base::c(3, 33, 6, 24, 50))
analyze_24(base::c(18, 2, 37, 55, 66))

# ------------------------------
# Question 5 (10%)
# ------------------------------

# Find the second largest number in a given numeric vector
find_second_max <- function(vector) {
  sorted_vector <- base::sort(base::unique(vector), decreasing = TRUE)
  second_max <- sorted_vector[2]
  base::cat("Second Maximum Value:", second_max, "\n")
}

# Example usage
find_second_max(base::c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10))
find_second_max(base::c(10, 9, 8, 7, 6, 5, 4, 3, 2, 1))
find_second_max(base::c(5, 5, 5, 5, 5, 5, 5, 5, 5, 5))
find_second_max(base::c(-1, -2, -3, -4, -5, -6, -7, -8, -9, -10))
find_second_max(base::c(-10, -9, -8, -7, -6, -5, -4, -3, -2, -1))
find_second_max(base::c(12, 76, 34, 89, 56, 23, 78, 45, 90, 67))
base::cat("\n")

# ------------------------------
# Question 6 (10%)
# ------------------------------

# Check if a given 5-digit number is a palindrome
is_palindrome <- function(check_number) {
  digits <- base::strsplit(base::as.character(check_number), "")[[1]]
  if (base::all(digits == base::rev(digits))) {
    base::cat(check_number, "is a palindrome", "\n")
  } else {
    base::cat(check_number, "is not a palindrome", "\n")
  }
}
is_palindrome(12321)
is_palindrome(12345)
base::cat("\n")

# ------------------------------
# Question 7 (10%)
# ------------------------------

# Calculate electricity bill based on tiered pricing
electricity_bill <- function(units) {
  # Tiered pricing (non-commercial, non-summer assumed)
  rates <- base::c(1.63, 2.38, 3.52, 4.80, 5.66)
  thresholds <- base::c(120, 330, 500, 700, Inf)

  usage <- units
  bill <- 0
  upper <- 0

  for (i in base::seq_along(rates)) {
    lower <- upper
    upper <- base::min(usage, thresholds[i])
    bill <- bill + (upper - lower) * rates[i]

    if (usage <= thresholds[i]) break
  }

  return(bill)
}

# Example usage
result <- electricity_bill(units = 800)
base::cat("Electricity Bill:", result, "")
