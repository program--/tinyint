#' @export
`names<-.tinyint` <- function(x, value) {
    if (!is.null(value) && length(value) != length(x)) {
        stop("`value` is not the same length as `x`.")
    }

    attr(x, "nms") <- value
    x
}

#' @export
names.tinyint <- function(x) {
    attr(x, "nms")
}

#' @export
unname.tinyint <- function(obj, force = FALSE) {
    if (!is.null(names(obj))) {
        names(obj) <- NULL
    }

    obj
}