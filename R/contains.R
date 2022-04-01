#' @export
contains <- function(x, ...) {
    y <- c(...)
    i <- tinyint_contains_(x, as.integer(y))
    i[y != round(y)] <- FALSE
    i
}

#' @export
match <- function(x, table, nomatch = NA_integer_, incomparables = NULL) {
    if (is.tinyint(table)) {
        .Class <- "tinyint"
        match.tinyint(
            x, table,
            nomatch = nomatch,
            incomparables = incomparables
        )
    } else {
        match(x, table, nomatch = nomatch, incomparables = incomparables)
    }
}

match.tinyint <- function(
    x, table, nomatch = NA_integer_, incomparables = NULL
) {
    if (is.tinyint(table)) {
        i <- tinyint_index_(table, as.integer(x))
        i[x != round(x)] <- nomatch
        if (any(i) == -1) i[i == -1] <- nomatch
        i
    } else {
        match(x, table, nomatch = nomatch)
    }
}

`%in%.tinyint` <- function(x, table) {
    match(x, table, nomatch = -1L) > -1L
}