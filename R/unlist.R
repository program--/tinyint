#' @export
unlist.tinyint <- function(x, ...) {
    tinyint_gets_(x, 0L:(length(x) - 1))
}