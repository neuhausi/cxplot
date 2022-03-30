#' Title
#'
#' @param gg
#' @param cx
#' @param path
#'
#' @return
#' @export
#'
#' @examples
cx_geom_histogram <- function(gg, cx, path) {
  r = list(
    graphType = "Scatter2D",
    hideHistogram = ifelse(missing(path),  FALSE, TRUE),
    showHistogramPath = ifelse(missing(path),  FALSE, TRUE),
    showHistogramDensity = FALSE,
    histogramType = ifelse(missing(path), "stacked", "dodged"),
    histogramStat = ifelse(!is.null(gg$y) && gg$y == "after_stat(density)", "density", "count"),
    histogramData = ifelse(!is.null(gg$colour), gg$colour, ifelse(!is.null(gg$fill), gg$fill, TRUE))
  )
  a = as.array(c('bw', 'adjust', 'kernel', 'bins', 'binwidth'))
  p = as.array(c('bandwidthRule', 'bandwidthAdjust', 'densityKernel', 'histogramBins', 'histogramBinWidth'))
  for (i in 1:length(a)) {
    if (!is.null(gg$GeomBar[[a[i]]])) {
      r[[p[i]]] = gg$GeomBar[[a[i]]]
    }
  }
  if (is.null(r$histogramBins)) {
    r$histogramBins = 30
  }
  r
}

#' Title
#'
#' @param gg
#' @param cx
#'
#' @return
#' @export
#'
#' @examples
cx_geom_path <- function(gg, cx) {
  cx_geom_histogram(gg, cx, TRUE)
}


