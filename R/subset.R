#' @title Tiny Integers
#' @rdname tinyint-package
#' @export
`[.tinyint` <- function(x, i, ...) {
    if (length(i) > 1) {
        as.tinyint(tinyint_gets_(x, i - 1L))
    } else {
        as.tinyint(tinyint_get_(x, i - 1L))
    }
}

#' @rdname tinyint-package
#' @export
`[[.tinyint` <- function(x, i, ...) `[`(x, i, ...)