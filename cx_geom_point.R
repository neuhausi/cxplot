cx_geom_point <- function(gg, cx) {
  r = list()
  if ('graphType' %in% names(cx)) {
    
  } else if (length(gg$dataCols) == 1) {
    r$graphType = 'Dotplot'
  } else {
    r$graphType = 'Scatter2D'
  }
  if ("GeomContour" %in% gg$geoms || "GeomContourFilled" %in% gg$geoms) {
    if (is.data.frame(gg$GeomPoint$data)) {
      r$decorations = cx_decoration_points(gg$GeomPoint$data)
    } else {
      r$showContourDataPoints = TRUE
    }
  }
  if (!is.null(gg$GeomPoint$colour) || !is.null(gg$GeomPoint$fill)) {
    if (!is.null(gg$GeomPoint$colour)) {
      if (gg$GeomPoint$colour %in% names(gg$data)) {
        r$colorBy = gg$GeomPoint$colour
      }
    } else {
      if (gg$GeomPoint$fill %in% names(gg$data)) {
        r$colorBy = gg$GeomPoint$fill
      }      
    }
  }
  if (!is.null(gg$GeomPoint$shape)) {
    if (gg$GeomPoint$shape %in% names(gg$data)) {
      r$shapeBy = gg$GeomPoint$shape
    }
  }
  if (!is.null(gg$GeomPoint$size)) {
    if (gg$GeomPoint$size %in% names(gg$data)) {
      r$sizeBy = gg$GeomPoint$size
    }
  }
  r
}

cx_decoration_points <- function (d) {
  p = as.vector(NULL)
  for (i in 1:dim(d)[1]) {
    p = append(p, list(list(x = d[i,]$x, y = d[i,]$y)))
  }
  p = list(point = as.list(p))
  p
}
