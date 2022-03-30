#' Title
#'
#' @param gg
#' @param cx
#'
#' @return
#' @export
#'
#' @examples
cx_theme <- function(gg, cx) {
  t = list(
    widthFactor = 2,
    theme = "GGPlot"
  )
  ## Legend
  if (!is.null(gg$legend.position)) {
    if (gg$legend.position == 'none') {
      t$showLegend = FALSE
    } else if (gg$legend.position == 'top' || gg$legend.position == 'bottom') {
      t$legendPosition = gg$legend.position
      if (!is.null(cx$colorBy)) {
        t$legendColumns = length(unique(gg$data[[cx$colorBy]]))
      } else if (!is.null(cx$stackBy)) {
        t$legendColumns = length(unique(gg$data[[cx$stackBy]]))
      } else if (!is.null(cx$lineBy)) {
        t$legendColumns = length(unique(gg$data[[cx$lineBy]]))
      } else if (!is.null(cx$shapeBy)) {
        t$legendColumns = length(unique(gg$data[[cx$shapeBy]]))
      }
    } else {
      t$legendPosition = gg$legend.position
    }
  }
  #if (is.null(gg$dataCols) && is.null(cx$colorBy) && is.null(cx$shapeBy) && is.null(cx$sizeBy) && is.null(cx$stackBy) && is.null(cx$lineBy)) {
  if (is.null(cx$colorBy) && is.null(cx$shapeBy) && is.null(cx$sizeBy) && is.null(cx$stackBy) && is.null(cx$lineBy)) {
    t$showLegend = FALSE
  }
  t
}
