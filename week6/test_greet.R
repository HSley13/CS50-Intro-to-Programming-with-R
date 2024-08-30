source("greet.R")

# Test-Driven Development
testthat::test_that("`greet` say Hello to a user", {
    testthat::expect_equal(greet("Sley"), "Hello, Sley") # nolint
    testthat::expect_equal(greet("Mario"), "Hello, Mario")
    testthat::expect_equal(greet("Peach"), "Hello, Peach")
    testthat::expect_equal(greet("Bowser"), "Hello, Bowser")
})

# Behavior-Driven Development
testthat::describe("greet()", {
    testthat::it("can say Hello to a user", { # nolint
        name <- "Sley" # nolint
        testthat::expect_equal(greet(name), "Hello, Sley")
    }) # nolint

    testthat::it("can say Hello to the World", { # nolint
        testthat::expect_equal(greet(), "Hello, World") # nolint
    }) # nolint
})
