#' Title
#'
#' @param gg
#' @param g
#'
#' @return
#' @export
#'
#' @examples
cx_geom_quantile <- function(gg, g) {
  r = list(
    graphType = "Scatter2D",
    showQuantileRegressionFit = TRUE
  )
  a = as.array(c('quantiles', 'colour', 'size', 'alpha'))
  p = as.array(c('quantiles', 'fitLineColor', 'fitLineWidth', 'fitLineTransparency'))
  for (i in 1:length(a)) {
    if (!is.null(gg$GeomQuantile[[a[i]]])) {
      if (a[i] == 'size') {
        r[[p[i]]] = gg$GeomQuantile[[a[i]]] * 2;
      } else {
        r[[p[i]]] = gg$GeomQuantile[[a[i]]]
      }
    }
  }
  #print(r)
  r
}
