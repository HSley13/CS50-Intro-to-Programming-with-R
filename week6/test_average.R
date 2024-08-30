source("average.R")

testthat::test_that("`average` calculates mean", {
    testthat::expect_equal(average(c(1, 2, 3)), 2) # nolint
    testthat::expect_equal(average(c(-1, -2, -3)), -2)
    testthat::expect_equal(average(c(-1, 0, 1)), 0)
    testthat::expect_equal(average(c(-2, -1, 1, 2)), 0)
    testthat::expect_equal(average(c(0.1, 0.5)), 0.3)
}) # nolint

testthat::test_that("`average` returns NA with NAs in input", {
    testthat::expect_equal(base::suppressWarnings(average(c(1, NA, 3))), NA) # nolint
    testthat::expect_equal(base::suppressWarnings(average(c(NA, NA, NA))), NA) # Corrected line #nolint
}) # nolint

testthat::test_that("`average` warns about any NAs in input", {
    testthat::expect_warning(average(c(1, NA, 3))) # nolint
    testthat::expect_warning(average(c(NA, NA, NA)))
}) # nolint

testthat::test_that("`average` stops if `x` is non-numeric", {
    testthat::expect_error(average(c("quack!"))) # nolint
    testthat::expect_error(average(c("1", "2", "3")))
}) # nolint
