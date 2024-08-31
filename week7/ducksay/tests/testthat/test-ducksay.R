testthat::describe("ducksay()", {
  testthat::it("can print to the console with `cat`", {
    testthat::expect_output(cat(ducksay()))
  })

  testthat::it("can say Hello to the World", {
    testthat::expect_match(ducksay(), "Hello, World")
  })

  testthat::it("can say Hello with a duck", {
    duck <- base::paste( # nolint
      ">(. )__",
      " (_____/",
      sep = "\n"
    ) # nolint
    testthat::expect_match(ducksay(), duck, fixed = TRUE)
  })

  testthat::it("can say any given phrase", {
    testthat::expect_match(ducksay("quack!"), "quack!")
  })
})
