cx_geom_contour <- function(gg, cx, t) {
  if (missing(t)) {
    t = 'GeomContour'
  }
  r = list(
    graphType = ifelse((t == 'GeomContour' || t == 'GeomContourFilled'), "ScatterBubble2D", "Scatter2D"),
    contourFilled = ifelse(t == 'GeomContour', FALSE, ifelse((t == 'GeomContourFilled' || t == 'GeomDensity2dFilled'), TRUE, FALSE))
  )
  a = as.array(c('bins', 'binwidth', 'breaks', 'contour_var'))
  p = as.array(c('contourLevelNumber','contourLevelWidth', 'contourLevels', 'contourStat'))  
  for (i in 1:length(a)) {
    if (!is.null(gg[[t]][[a[i]]])) {
      r[[p[i]]] = gg[[t]][[a[i]]]
    }
  }
  if (t == 'GeomRaster') {
    r$showContourBands = FALSE
    r$contourType = 'raster'
  } else if (t == 'GeomPoint') {
    r$showContourBands = FALSE
    r$contourType = 'point'
  } else {
    r$contourType = 'normal'
  }
  if (!is.null(gg[[t]]$colour) || !is.null(gg[[t]]$fill)) {
    if (!is.null(gg[[t]]$colour)) {
      if (gg[[t]]$colour %in% names(gg$data)) {
        r$afterRender = list(list("createContour",list(gg[[t]]$colour),list(NULL)))
      } else {
        r$contourBandsColor = gg[[t]]$colour
        r$afterRender = list(list("createContour",list(NULL),list(NULL)))
      }
    } else {
      if (gg[[t]]$fill %in% names(gg$data)) {
        r$afterRender = list(list("createContour",list(gg[[t]]$fill),list(NULL)))
      } else {
        r$contourBandsColor = gg[[t]]$fill
        r$afterRender = list(list("createContour",list(NULL),list(NULL)))
      }      
    }
  } else {
    if ((t == "GeomContourFilled" || t == 'GeomDensity2dFilled' ) && !is.null(gg$facet)) {
      r$afterRender = list(list("createContour",list(gg$facet),list(NULL)))
    } else {
      r$afterRender = list(list("createContour",list(NULL),list(NULL)))
    }
  }
  if (t == "GeomContourFilled" || t == 'GeomDensity2dFilled') {
    r$showContourBands = FALSE
  }
  if (!is.null(gg[[t]]$alpha)) {
    r$contourFilledTransparency = gg[[t]]$alpha
  }
  r
}

cx_geom_contour_filled <- function (gg, cx) {  
  cx_geom_contour(gg, cx, "GeomContourFilled")
}

cx_geom_raster <- function (gg, cx) {
  cx_geom_contour(gg, cx, "GeomRaster")
}