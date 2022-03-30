#' Title
#'
#' @param gg
#' @param g
#'
#' @return
#' @export
#'
#' @examples
cx_geom_violin <- function(gg, g) {
  r = list(
    graphType = "Boxplot",
    showViolinBoxplot = TRUE,
    violinTransparency = ifelse(is.null(gg$GeomViolin$alpha), 1, gg$GeomViolin$alpha),
    widthFactor = 1
  )
  a = as.array(c('bw', 'adjust', 'kernel', 'scale', 'trim'))
  p = as.array(c('bandwidthRule', 'bandwidthAdjust', 'densityKernel', 'violinScale', 'violinTrim'))
  for (i in 1:length(a)) {
    if (!is.null(gg$GeomViolin[[a[i]]])) {
      r[[p[i]]] = gg$GeomViolin[[a[i]]]
    }
  }
  if (!is.null(gg$GeomViolin$draw_quantiles)) {
    r$showViolinQuantiles = TRUE
  }
  if (!is.null(gg$GeomViolin$colour) && !(gg$GeomViolin$colour %in% names(gg$data))) {
    r$violinBorderColor = paste("rgb(", paste(grDevices::col2rgb(gg$GeomViolin$colour)[,1], collapse = ","), ")", sep = "")
  }
  if (!is.null(gg$GeomViolin$fill) && !(gg$GeomViolin$fill %in% names(gg$data))) {
    r$violinColor = paste("rgb(", paste(grDevices::col2rgb(gg$GeomViolin$fill)[,1], collapse = ","), ")", sep = "")
  }
  if (!("GeomBoxplot" %in% gg$geoms)) {
    r$showBoxplotIfViolin = FALSE
  }
  if ("GeomPoint" %in% gg$geoms) {
    r$showBoxplotOriginalData = TRUE
  }
  if (!is.null(gg$y) && !(gg$y %in% gg$dataCols)) {
    r$graphOrientation = 'horizontal'
  } else {
    r$graphOrientation = 'vertical'
  }
  r
}
