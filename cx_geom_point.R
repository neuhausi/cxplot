cx_geom_point <- function(gg, cx) {
  r = list()
  if ('graphType' %in% names(cx)) {
    
  } else {
    r$graphType = 'Scatter2D'
  }
  r
}