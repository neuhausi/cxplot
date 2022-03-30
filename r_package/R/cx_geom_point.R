#' Title
#'
#' @param gg
#' @param cx
#'
#' @return
#' @export
#'
#' @examples
cx_geom_point <- function(gg, cx) {
  if (!is.null(gg$GeomPoint$contour) || !is.null(gg$GeomPoint$contour_var)) {
    cx_geom_contour(gg, cx, "GeomPoint")
  } else {
    r = list()
    if (length(gg$dataCols) == 1) {
      g = 'Dotplot'
    } else {
      g = 'Scatter2D'
    }
    if (gg$GeomPoint$position == "jitter") {
      r$jitter = TRUE
      if (!is.null(gg$GeomPoint$width)) {
        r$jitterFactor = gg$GeomPoint$width
      }
    }
    if ("GeomContour" %in% gg$geoms || "GeomContourFilled" %in% gg$geoms || "GeomDensity2d" %in% gg$geoms || "GeomDensity2dFilled" %in% gg$geoms) {
      if (is.data.frame(gg$GeomPoint$data)) {
        r$decorations = cx_decoration_points(gg$GeomPoint$data, 'x', 'y')
      } else {
        r$showContourDataPoints = TRUE
      }
    } else if (is.data.frame(gg$GeomPoint$data)) {
      if (g == 'Dotplot') {
        if (!is.null(gg$GeomPoint$x)) {
          r$decorations = cx_decoration_points(gg$GeomPoint$data, NULL, gg$GeomPoint$x, gg$y)
        } else if (!is.null(gg$GeomPoint$y)) {
          r$decorations = cx_decoration_points(gg$GeomPoint$data, NULL, gg$GeomPoint$y, gg$x)
        }
      } else {
        r$decorations = cx_decoration_points(gg$GeomPoint$data, gg$GeomPoint$x, gg$GeomPoint$y)
      }
    }
    if ('graphType' %in% names(cx)) {

    } else if (length(gg$dataCols) == 1) {
      r$graphType = 'Dotplot'
    } else {
      r$graphType = 'Scatter2D'
    }
    r
  }
}

#' Title
#'
#' @param d
#' @param x
#' @param y
#' @param v
#'
#' @return
#' @export
#'
#' @examples
cx_decoration_points <- function (d, x = NULL, y = NULL, v = NULL) {
  p = as.vector(NULL)
  for (i in 1:dim(d)[1]) {
    if (!is.null(x) && !is.null(y)) {
      p = append(p, list(list(x = d[i,][[x]], y = d[i,][[y]])))
    } else if (!is.null(y) && !is.null(v)) {
      if (i > 1) {
        if (d[i - 1,][[y]] == d[i,][[y]] && d[i - 1,][[v]] == d[i,][[v]]) {
          next
        } else {
          p = append(p, list(list(value = d[i,][[y]], smp = d[i,][[v]])))
        }
      } else {
        p = append(p, list(list(value = d[i,][[y]], smp = d[i,][[v]])))
      }
    }
  }
  p = list(point = as.list(p))
  p
}
