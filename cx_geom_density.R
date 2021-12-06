cx_geom_density <- function(gg, cx) {
  r = list(
    graphType = "Scatter2D",
    hideHistogram = TRUE,
    showHistogramDensity = TRUE,
    histogramStat = ifelse(!is.null(gg$y) && gg$y == "after_stat(count)", "count", "density"),
    histogramData = ifelse(!is.null(gg$colour), gg$colour, ifelse(!is.null(gg$fill), gg$fill, TRUE)),
    showFilledHistogramDensity = ifelse(!is.null(gg$fill), TRUE, FALSE)
  )
  a = as.array(c('alpha', 'bw', 'adjust', 'kernel', 'position'))
  p = as.array(c('histogramDensityFillTransparency','bandwidthRule', 'bandwidthAdjust', 'densityKernel', 'densityPosition'))
  for (i in 1:length(a)) {
    if (!is.null(gg$GeomDensity[[a[i]]])) {
      r[[p[i]]] = gg$GeomDensity[[a[i]]]
    }
  }
  r
}

cx_geom_density_2d <- function(gg, cx) {
  cx_geom_contour(gg, cx, 'GeomDensity2d')
}

cx_geom_density_2d_filled <- function (gg, cx) {  
  cx_geom_contour(gg, cx, 'GeomDensity2dFilled')
}



