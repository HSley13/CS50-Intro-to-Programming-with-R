# Test 1: Basic functionality with alphabetical characters
testthat::test_that("stringr::str_length returns correct length for simple strings", { # nolint
    testthat::expect_equal(stringr::str_length("hello"), 5) # nolint
    testthat::expect_equal(stringr::str_length("world"), 5)
})

# Test 2: Handling of non-alphabetical characters, including whitespace and punctuation # nolint
testthat::test_that("stringr::str_length handles non-alphabetical characters correctly", { # nolint
    testthat::expect_equal(stringr::str_length(" "), 1) # nolint
    testthat::expect_equal(stringr::str_length("!@#$%^&*()"), 10)
    testthat::expect_equal(stringr::str_length("😊"), 1)
})

# Test 3: Handling of special values like NA, NaN, Inf, -Inf
testthat::test_that("stringr::str_length handles special values correctly", {
    testthat::expect_equal(stringr::str_length(NA), NA_integer_) # NA should return NA # nolint
    testthat::expect_equal(stringr::str_length(NaN), 3) # "NaN" has a length of 3 # nolint
    testthat::expect_equal(stringr::str_length(Inf), 3) # "Inf" has a length of 3 # nolint
    testthat::expect_equal(stringr::str_length(-Inf), 4) # "-Inf" has a length of 4 # nolint
})

# Test 4: Handling of vector inputs
testthat::test_that("stringr::str_length handles vector inputs correctly", {
    testthat::expect_equal(stringr::str_length(c("hello", "world")), c(5, 5)) # Vector of strings # nolint
    testthat::expect_equal(stringr::str_length(c("a", "ab", "abc")), c(1, 2, 3)) # Vector with different lengths # nolint
})
