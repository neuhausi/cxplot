#' Title
#'
#' @param gg
#' @param cx
#'
#' @return
#' @export
#'
#' @examples
cx_geom_line <- function(gg, cx) {
  r = list(
    graphType = 'Line'
  )
  if (!is.null(gg$GeomLine$linetype)) {
    r$patternBy = gg$GeomLine$linetype
  }
  r
}
