cx_geom_point <- function(gg, cx) {
  r = list()
  if ('graphType' %in% names(cx)) {
    
  } else if (length(gg$dataCols) == 1) {
    r$graphType = 'Dotplot'
  } else {
    r$graphType = 'Scatter2D'
  }
  r
}