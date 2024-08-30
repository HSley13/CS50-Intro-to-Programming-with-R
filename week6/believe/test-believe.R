base::source("believe.R")

# Test for a basic numeric vector
testthat::test_that("Basic numeric vector", {
    vec <- c(1, 2, 3) # nolint
    result <- sum_of_squares(vec)
    testthat::expect_equal(result, 14) # 1^2 + 2^2 + 3^2 = 14 # nolint
})

# Test for a vector with a single element
testthat::test_that("Single element vector", {
    vec <- c(4) # nolint
    result <- sum_of_squares(vec)
    testthat::expect_equal(result, 16) # 4^2 = 16 # nolint
})

# Test for a vector with negative numbers
testthat::test_that("Vector with negative numbers", {
    vec <- c(-1, -2, -3) # nolint
    result <- sum_of_squares(vec)
    testthat::expect_equal(result, 14) # (-1)^2 + (-2)^2 + (-3)^2 = 14 # nolint
})

# Test for an empty vector
testthat::test_that("Empty vector", {
    vec <- c() # nolint
    result <- sum_of_squares(vec)
    testthat::expect_equal(result, 0) # Sum of squares of an empty vector is 0
})

# Test for a vector with zeros
testthat::test_that("Vector with zeros", {
    vec <- c(0, 0, 0) # nolint
    result <- sum_of_squares(vec)
    testthat::expect_equal(result, 0) # 0^2 + 0^2 + 0^2 = 0 # nolint
})
