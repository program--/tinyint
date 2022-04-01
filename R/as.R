#' @export
as.integer.tinyint <- function(x, ...) {
    tinyint_gets_(x, 0L:(length(x) - 1))
}

#' @export
as.double.tinyint <- function(x, ...) {
    as.double(as.integer(x, ...))
}

#' @export
as.numeric.tinyint <- function(x, ...) {
    as.numeric(as.integer(x, ...))
}

#' @export
as.character.tinyint <- function(x, ...) {
    as.character(as.integer(x, ...))
}

#' @export
as.list.tinyint <- function(x, ...) {
    as.list(as.integer(x, ...))
}

#' @export
as.data.frame.tinyint <- function(x, row.names = NULL, optional = FALSE, ...) {
    V1 <- as.integer(x)
    as.data.frame(
        V1,
        row.names = row.names,
        optional = optional,
        ...
    )
}