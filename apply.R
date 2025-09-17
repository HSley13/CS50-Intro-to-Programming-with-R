m <- matrix(1:9, nrow = 3)

# Central Tendency
apply(m, 1, median) # Row medians
apply(m, 2, mean) # Column means (same as rowMeans(m))

# Dispersion
apply(m, 1, sd) # Row standard deviations
apply(m, 2, var) # Column variances
apply(m, 1, IQR) # Row interquartile ranges
apply(m, 2, mad) # Column median absolute deviations

# Extremes
apply(m, 1, max) # Row maximums
apply(m, 2, min) # Column minimums
apply(m, 1, range) # Row ranges (returns matrix)

# Quantiles
apply(m, 2, quantile, probs = c(0.25, 0.75)) # Column quartiles




# Counting
apply(m > 5, 1, sum) # Count values >5 per row
apply(m, 2, function(x) sum(x %% 2 == 0)) # Count even numbers per column

# Logical tests
apply(m, 1, anyNA) # Check for NAs per row
apply(m, 2, is.numeric) # Verify column types




# Mathematical operations
apply(m, 1, log) # Natural log of each row
apply(m, 2, sqrt) # Square root of each column
apply(m, 1, round, digits = 1) # Round row values

# Cumulative calculations
apply(m, 2, cumsum) # Column cumulative sums
apply(m, 1, cumprod) # Row cumulative products





# Custom metric: % of values > threshold
apply(m, 2, function(col) mean(col > 5) * 100)

# Normalize columns (scale to 0-1)
apply(m, 2, function(x) (x - min(x)) / (max(x) - min(x)))

# Winsorize data (cap outliers)
apply(m, 1, function(row) {
  q <- quantile(row, c(0.05, 0.95))
  row[row < q[1]] <- q[1]
  row[row > q[2]] <- q[2]
  row
})




char_matrix <- matrix(letters[1:9], nrow = 3)

apply(char_matrix, 1, paste, collapse = "") # Concatenate rows
apply(char_matrix, 2, toupper) # Uppercase columns
