#' Title
#'
#' @param gg
#' @param cx
#'
#' @return
#' @export
#'
#' @examples
cx_facet <- function (gg, cx) {
  if (length(gg$facetLevels) > 0) {
    if (cx$graphType %in% c('Scatter2D', 'ScatterBubble2D', 'Scatter3D')) {
      r = list(
        segregateVariablesBy = gg$facet
      )
    } else {
      r = list(
        segregateSamplesBy = gg$facet
      )
    }
    r$layoutTopology = gg$facetTopology
  } else {
    r = list()
  }
  r
}
