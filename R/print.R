#' @export
print.tinyint <- function(x, ...) {
    cat("<tinyint>\n")
    len      <- length(x)
    interval <- 0L:as.integer(if (len < 5L) len - 1L else 4L)
    y <- tinyint_gets_(x, interval)

    if (!is.null(names(x))) {
        names(y) <- names(x)[interval + 1]
    }

    print(y)

    if (len > 5L) {
        cat("... and", len - 5L, "more")
    }

    NULL
}