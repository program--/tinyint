.onLoad <- function(libname, pkgname) {
    ns <- getNamespace("tinyint")
    assign("match", match, pos = ns)
    assign("%in%", `%in%.tinyint`, pos = ns)
}