#' Axes
#'
#' @param gg
#' @param cx
#'
#' @return
#' @export
#'
#' @examples

cx_axes <- function (gg, cx) {
  graphOrientation = ifelse(!is.null(cx$graphOrientation), cx$graphOrientation, 'vertical')
  smpLabelRotate = ifelse(graphOrientation == 'horizontal', 0, 90)
  if (cx$graphType %in% c("Line", "Bar", "Dotplot", "Boxplot")) {
    if (graphOrientation == 'horizontal') {
      r = list(
        graphOrientation = graphOrientation,
        smpTitle = gg$yAxisTitle,
        xAxis2Title = gg$xAxisTitle,
        xAxisShow = FALSE
      )
      if (!is.null(cx$groupingFactors)) {
        r$sortOnGrouping = "descending"
      }
    } else {
      r = list(
        graphOrientation = graphOrientation,
        smpLabelRotate = smpLabelRotate,
        smpTitle = gg$xAxisTitle,
        xAxisTitle = gg$yAxisTitle,
        xAxis2Show = FALSE
      )
    }
  } else {
    r = list(
      xAxis = list(gg$x),
      yAxis = list(gg$y),
      xAxisTitle = gg$xAxisTitle,
      yAxisTitle = gg$yAxisTitle
    )
  }
  r
}
