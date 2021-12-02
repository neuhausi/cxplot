## Combine parameters from two lists and
##  overwrite parameters in the first one
gg_append <- function (a, b) {
  l = c(a[setdiff(names(a), names(b))], b)
  l
}

## Facet
gg_facet <- function (o) {
  if (missing(o)) {
    o = last_plot()
  }
  f = o$facet$params$facets
  if(!is.null(f)) {
    f = list(
      facet = ls(f),
      facetLevels = sort(unique(o$data[[ls(f)]]))
    )
    if (!is.null(o$facet$params$ncol) && !is.null(o$facet$params$nrow)) {
      f$facetCols = o$facet$params$ncol
      f$facetRows = o$facet$params$nrow
    } else if (is.null(o$facet$params$ncol) && !is.null(o$facet$params$nrow)) {
      f$facetRows = o$facet$params$nrow
      f$facetCols = ceiling(length(f$facetLevels) / f$facetRows)
    } else if (!is.null(o$facet$params$ncol) && is.null(o$facet$params$nrow)) {
      f$facetCols = o$facet$params$ncol
      f$facetRows = ceiling(length(f$facetLevels) / f$facetCols)
    } else {
      if (length(f$facetLevels) < 4) {
        f$facetRows = 1
        f$facetCols = length(f$facetLevels)
      } else {
        f$facetCols = ceiling(sqrt(length(f$facetLevels)))
        f$facetRows = ceiling(length(f$facetLevels) / f$facetCols)
      }
    }
    f$facetTopology = paste(f$facetRows, 'X', f$facetCols, sep = '')
  }
  f
}

## Theme
gg_theme <- function(o) {
  if (missing(o)) {
    o = last_plot()
  }
  t = list()
  atts = ls(o$theme)
  if (length(atts) > 0) {
    for (a in atts) {
      t[[a]] = o$theme[[a]]
    }
  }
  t
}

## Data Limits
gg_datalimits <- function(o) {
  if (missing(o)) {
    o = last_plot()
  }
  gb = ggplot_build(o)
  xmin = gb$layout$panel_scales_x[[1]]$range$range[1]
  xmax = gb$layout$panel_scales_x[[1]]$range$range[2]
  ymin = gb$layout$panel_scales_y[[1]]$range$range[1]
  ymax = gb$layout$panel_scales_y[[1]]$range$range[2]
  list(xmin = xmin, 
       xmax = xmax, 
       ymin = ymin, 
       ymax = ymax)
}

## User defined limits
## Look at this o$scales$scales
gg_scalelimits <- function(o) {
  if (missing(o)) {
    o = last_plot()
  }
  gb = ggplot_build(o)
  xmin = gb$layout$panel_params[[1]]$x.range[1]
  xmax = gb$layout$panel_params[[1]]$x.range[2]
  ymin = gb$layout$panel_params[[1]]$y.range[1]
  ymax = gb$layout$panel_params[[1]]$y.range[2]
  list(xmin = xmin, 
       xmax = xmax, 
       ymin = ymin, 
       ymax = ymax)
}

# X scale
gg_xscale <- function(o) {
  if (missing(o)) {
    o = last_plot()
  }
  n = length(o$scales$scales)
  r = FALSE
  if (n > 0) {
    r = list(
      setMinX = o$scales$scales[[1]]$limits[1],
      setMaxX = o$scales$scales[[1]]$limits[2]
    )
  }
  r
}

# Y scale
gg_yscale <- function(o) {
  if (missing(o)) {
    o = last_plot()
  }
  n = length(o$scales$scales)
  r = FALSE
  if (n > 1) {
    r = list(
      setMinY = o$scales$scales[[2]]$limits[1],
      setMaxY = o$scales$scales[[2]]$limits[2]
    )
  }
  r
}

## Scales
gg_scales <- function (o) {
  if (missing(o)) {
    o = last_plot()
  }
  r = list();
  x = gg_xscale(o)
  y = gg_yscale(o)
  if (!isFALSE(x)) {
    r$setMinX = x$setMinX
    r$setMaxX = x$setMaxX
  }
  if (!isFALSE(y)) {
    r$setMinY = y$setMinY
    r$setMaxY = y$setMaxY
  }
  r
}

## Labels
gg_labels <- function (o) {
  if (missing(o)) {
    o = last_plot()
  }
  r = list();
  l = c('x', 'y', 'z', 'title', 'subtitle')
  for (i in l) {
    if (!is.null(o$labels[[i]])) {
      if (i %in% c('title', 'subtitle')) {
        r[[i]] = o$labels[[i]]
      } else {
        r[[paste(i, 'AxisTitle', sep='')]] = o$labels[[i]]
      }
    }
  }
  r
}

## Mapping
gg_mapping <- function(o) {
  if (missing(o)) {
    o = last_plot()
  }
  r = list();
  m = c('x', 'y', 'z', 'weight', 'group', 'colour', 'fill', 'size', 'alpha', 'linetype', 'label', 'vjust')
  for (i in m) {
    if (!is.null(o$mapping[[i]])) {
      r[[i]] = as_label(o$mapping[[i]])
    }
  }
  r  
}

## Layers
gg_layers <- function(o) {
  if (missing(o)) {
    o = last_plot()
  }
  layers = sapply(o$layers, function(x) class(x$geom)[1])
  r = list(
    geoms = layers
  )
  for (i in 1:length(layers)) {
    r[[layers[i]]] = gg_proc_layer(o$layers[[i]]) 
  }
  r
}

## Mappings in a layers
gg_proc_layer <- function (l) {
  f = isFALSE(l$position$fill) || is.null(l$position$fill)
  v = isFALSE(l$position$vjust) || is.null(l$position$vjust)
  w = !is.null(l$position$width)
  r = list()
  if (!is.null(l$mapping)) {
    atts = ls(l$mapping)
    if (length(atts) > 0) {
      for (a in atts) {
        b = as_label(l$mapping[[a]])
        r[[a]] = b
      }
    }
  }
  prps = c('aes_params', 'geom_params', 'stat_params')
  for (p in prps) {
    if (!is.null(l[[p]])) {
      atts = ls(l[[p]])
      if (length(atts) > 0) {
        for (a in atts) {
          if (a == 'position') {
            next
          }
          r[[a]] = l[[p]][[a]]
        }
      }
    }
  }
  r$position = ifelse(!is.null(l$position$width), 'jitter', ifelse(f == TRUE & v == TRUE, "normal", ifelse(f == FALSE, 'filled', 'stacked')))
  if (is.data.frame(l$data)) {
    r$data = l$data
  }
  r
}

## Data Columns
gg_data_cols <- function(gg) {
  n = c('x', 'y', 'z', 'weight')
  d = as.vector(NULL)
  l = NULL
  for (i in n) {
    if (i %in% names(gg)) {
      if (gg[[i]] %in% colnames(gg$data)) {
        if (all(unlist(lapply(gg$data[,c(gg[[i]]), drop = FALSE],is.numeric)))) {
          d = append(d, gg[[i]]);
        }
      }
    }
  }
  if (length(d) < 1) {
    for (g in gg$geoms) {
      for (i in n) {
        if (i %in% names(gg[[g]])) {
          if (gg[[g]][[i]] %in% colnames(gg$data)) {
            if (all(unlist(lapply(gg$data[,c(gg[[g]][[i]]), drop = FALSE],is.numeric)))) {
              d = append(d, gg[[g]][[i]]);
            }
          }
        }
      }
    }
  }
  r = list(
    dataCols = d
  )
  r
}

## Data Rows
gg_data_rows <- function(gg) {
  n = c('x', 'y', 'z', 'weight')
  d = NULL
  l = NULL
  r = list()
  for (i in n) {
    if (i %in% names(gg)) {
      if (gg[[i]] %in% colnames(gg$data)) {
        if (!all(unlist(lapply(gg$data[,c(gg[[i]]), drop = FALSE],is.numeric)))) {
          if (dim(gg$data[,c(gg[[i]]), drop = FALSE])[1] == dim(unique(gg$data[,c(gg[[i]]), drop = FALSE]))[1]) {
            d = gg$data[,c(gg[[i]])]
            l = gg[[i]]
          }
        }
      }
    }
  }
  if (!is.null(r)) {
    r$dataRows = d
    r$dataRowsName = l
  }
  r
}

## Data Summary
gg_data_summary <- function(gg) {
  n = c('x', 'y', 'z')
  s = "raw"
  v = FALSE
  r = list()
  a = as.vector(NULL)
  for (i in n) {
    if (i %in% names(gg)) {
      if (gg[[i]] %in% colnames(gg$data)) {
        if (!all(unlist(lapply(gg$data[,c(gg[[i]]), drop = FALSE],is.numeric)))) {
          if (dim(gg$data[,c(gg[[i]]), drop = FALSE])[1] != dim(unique(gg$data[,c(gg[[i]]), drop = FALSE]))[1]) {
            for (g in gg$geoms) {
              if ('weight' %in% names(gg[[g]])) {
                s = "sum"
                v = gg[[g]]$weight
                r$dataCols = c(v)
                a = append(a, gg[[i]])
                break
              } else {
                s = "count"
                v = gg[[i]]
                a = append(a, gg[[i]])
              }
            }
          }
        }
      }
    }
  }
  if (s == "raw" && is.null(gg$dataCols)) {
    for (g in gg$geoms) {
      for (i in n) {
        if (i %in% names(gg[[g]])) {
          if (gg[[g]][[i]] %in% colnames(gg$data)) {
            if (!all(unlist(lapply(gg$data[,c(gg[[g]][[i]]), drop = FALSE],is.numeric)))) {
              s = "count"
              v = gg[[g]][[i]]
              a = append(a, gg[[g]][[i]])
            }
          }
        }
      }
    }
  }
  for (g in gg$geoms) {
    for (i in c('colour', 'fill')) {
      if (i %in% names(gg[[g]])) {
        if (!is.null(gg$dataCols) && gg[[g]][[i]] %in% colnames(gg$data) && !all(unlist(lapply(gg$data[,c(gg[[g]][[i]]), drop = FALSE],is.numeric)))) {
          a = append(a, gg[[g]][[i]])
        }
      }
    }
  }
  if (s == "sum" || s == "count") {
    if (!isFALSE(v)) {
      r$dataColsSummary = v
    } else {
      s = "raw"
    }
  }
  if (length(a) > 0) {
    r$dataGrouping = unique(a)
  }
  r$dataSummary = s
  r
}

cxplot <- function (o) {
  
  library(ggplot2)
  library(dplyr)
  library(canvasXpress)
  source('cx_data.r')
  source('cx_axes.r')
  source('cx_theme.r')
  source('cx_facet.r')
  source('cx_geom_bar.r')
  source('cx_geom_boxplot.r')
  source('cx_geom_contour.r')
  source('cx_geom_density.r')
  source('cx_geom_line.r')
  source('cx_geom_point.r')
  source('cx_geom_text.r')
  source('cx_geom_xline.r')
  
  if (missing(o)) {
    o = last_plot()
  }
  
  if (!("ggplot") %in% class(o)) {
    stop("Not a ggplot object")  
  }
  
  ## CanvasXpress Parameters
  gg = list(
    data = o$data
  )
  gg = gg_append(gg, gg_facet(o))
  gg = gg_append(gg, gg_theme(o))
  gg = gg_append(gg, gg_scales(o))
  gg = gg_append(gg, gg_labels(o))
  gg = gg_append(gg, gg_mapping(o))
  gg = gg_append(gg, gg_layers(o))
  gg = gg_append(gg, gg_data_cols(gg))
  gg = gg_append(gg, gg_data_rows(gg))
  gg = gg_append(gg, gg_data_summary(gg))
  #print(gg)
  
  cx = list()
  for (i in 1:length(gg$geoms)) {
    g = gg$geoms[i]
    if (g == "GeomHline" || g == "GeomVline" || g == "GeomAbline") {
      cx = gg_append(cx, cx_geom_xline(gg, g))
    } else if (g == "GeomBar" || g == "GeomCol") {
      cx = gg_append(cx, cx_geom_bar(gg, cx))    
    } else if (g == "GeomBoxplot") {
      cx = gg_append(cx, cx_geom_boxplot(gg, cx))   
    } else if (g == "GeomContour") {
      cx = gg_append(cx, cx_geom_contour(gg, cx))
    } else if (g == "GeomContourFilled") {
      cx = gg_append(cx, cx_geom_contour_filled(gg, cx)) 
    } else if (g == "GeomDensity") {
      cx = gg_append(cx, cx_geom_density(gg, cx))
    } else if (g == "GeomDensity2d") {
      cx = gg_append(cx, cx_geom_density_2d(gg, cx))
    } else if (g == "GeomDensity2dFilled") {
      cx = gg_append(cx, cx_geom_density_2d_filled(gg, cx))    
    } else if (g == "GeomLine") {
      cx = gg_append(cx, cx_geom_line(gg, cx))
    } else if (g == "GeomPoint") {
      cx = gg_append(cx, cx_geom_point(gg, cx))
    } else if (g == "GeomRaster") {
      cx = gg_append(cx, cx_geom_raster(gg, cx))  
    } else if (g == "GeomText") {
      cx = gg_append(cx, cx_geom_text(gg, cx))
    }
  }
  cx = gg_append(cx, cx_data(gg, cx))
  cx = gg_append(cx, cx_axes(gg, cx))
  cx = gg_append(cx, cx_theme(gg, cx))
  cx = gg_append(cx, cx_facet(gg, cx))
  #print(cx)
  
  print(o)
  print (do.call(canvasXpress, cx))
}
