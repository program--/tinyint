testthat::test_that("integers can be converted to tinyints", {
    testthat::expect_s3_class(as.tinyint(c(1L, 2L, 3L)), "tinyint")
})

testthat::test_that("base type coercion applies to tinyints", {
    x <- as.tinyint(c(1, 2, 3))

    testthat::expect_type(as.integer(x), "integer")
    testthat::expect_equal(as.integer(x), c(1L, 2L, 3L))

    testthat::expect_type(as.double(x), "double")
    testthat::expect_equal(as.double(x), c(1.0, 2.0, 3.0))

    testthat::expect_true(class(as.numeric(x)) == "numeric")
    testthat::expect_equal(as.double(x), c(1, 2, 3))

    testthat::expect_type(as.character(x), "character")
    testthat::expect_equal(as.character(x), c("1", "2", "3"))

    testthat::expect_type(as.list(x), "list")
    testthat::expect_equal(as.list(x), list(1, 2, 3))

    testthat::expect_s3_class(as.data.frame(x), "data.frame")
    testthat::expect_equal(as.data.frame(x), data.frame(V1 = c(1, 2, 3)))
})