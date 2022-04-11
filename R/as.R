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
    lapply(x, as.tinyint)
}

#' @export
as.data.frame.tinyint <- function(x, row.names = NULL, optional = FALSE, ...) {
    ret <- data.frame(
        V1 = seq_len(length(x)),
        row.names = row.names,
        ...
    )
    ret$V1 <- x
    ret
}