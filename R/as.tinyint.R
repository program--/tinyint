#' Convert to `tinyint`
#' @rdname as.tinyint
#' @export
as.tinyint <- function(x, ...) {
    UseMethod("as.tinyint")
}

#' @rdname as.tinyint
#' @export
as.tinyint.numeric <- function(x, ...) {
    .Class <- "integer"
    NextMethod(as.integer(x, ...))
}

#' @rdname as.tinyint
#' @export
as.tinyint.double <- function(x, ...) {
    .Class <- "integer"
    NextMethod(as.integer(x, ...))
}

#' @rdname as.tinyint
#' @export
as.tinyint.integer <- function(x, ...) {
    y        <- tinyint_compress_(as.integer(c(x, ...)))
    class(y) <- "tinyint"
    y
}