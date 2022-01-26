cx_geom_boxplot <- function(gg, cx) {
  r = list(
    graphType = "Boxplot"
  )
  if (!is.null(gg$GeomBoxplot$notch)) {
    r$boxplotNotched = gg$GeomBoxplot$notch
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