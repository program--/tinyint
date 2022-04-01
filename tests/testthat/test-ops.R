testthat::test_that("subset operators work and return tinyints", {
    x <- as.tinyint(c(1L, 2L, 3L))
    y <- x[1:2]

    testthat::expect_s3_class(y, "tinyint")
    testthat::expect_equal(tinyint_get_(y, 0L), 1L)
})