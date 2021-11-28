cx_geom_bar <- function(gg, cx) {
  r = list(
    graphType = "Bar"
  )
  if (!is.null(gg$GeomBar$colour) || !is.null(gg$GeomBar$fill)) {
    r$stackBy = ifelse(!is.null(gg$GeomBar$colour), gg$GeomBar$colour, gg$GeomBar$fill) 
  }
  if ((!is.null(gg$GeomBar$y) && !(gg$GeomBar$y %in% gg$dataCols)) || ((is.null(gg$x) || gg$x == 'count') && !is.null(gg$y) && !(gg$y %in% gg$dataCols))) {
    r$graphOrientation = 'horizontal'
  } else {
    r$graphOrientation = 'vertical'
  }
  r  
}