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
  }
  f
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
  atts = c('x', 'y', 'z', 'weight', 'group', 'colour', 'fill', 'size', 'alpha', 'linetype', 'label', 'vjust', 'bins', 'binwidth', 'breaks',
        'bw', 'adjust', 'kernel', 'intercept', 'xintercept', 'yintercept', 'notch')
  f = isFALSE(l$position$fill) || is.null(l$position$fill)
  v = isFALSE(l$position$vjust) || is.null(l$position$vjust)
  w = !is.null(l$position$width)
  r = list()
  for (a in atts) {
    if (!is.null(l$mapping[[a]])) {
      r[[a]] = as_label(l$mapping[[a]])
    }
    if (!is.null(l$aes_params[[a]])) {
      r[[a]] = l$aes_params[[a]]
    }
    if (!is.null(l$geom_params[[a]])) {
      r[[a]] = l$geom_params[[a]]
    }
    if (!is.null(l$stat_params[[a]])) {
      r[[a]] = l$stat_params[[a]]
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
  for (i in n) {
    if (i %in% names(gg)) {
      if (all(unlist(lapply(gg$data[,c(gg[[i]]), drop = FALSE],is.numeric)))) {
        d = append(d, gg[[i]]);
      } 
    }
  }
  list(
    dataCols = d
  )
}

## Data Rows
gg_data_rows <- function(gg) {
  n = c('x', 'y', 'z', 'weight')
  d = NULL
  l = NULL
  r = list()
  for (i in n) {
    if (i %in% names(gg)) {
      if (!all(unlist(lapply(gg$data[,c(gg[[i]]), drop = FALSE],is.numeric)))) {
        if (dim(gg$data[,c(gg[[i]]), drop = FALSE])[1] == dim(unique(gg$data[,c(gg[[i]]), drop = FALSE]))[1]) {
          d = gg$data[,c(gg[[i]])]
          l = gg[[i]]
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
  for (i in n) {
    if (i %in% names(gg)) {
      if (!all(unlist(lapply(gg$data[,c(gg[[i]]), drop = FALSE],is.numeric)))) {
        if (dim(gg$data[,c(gg[[i]]), drop = FALSE])[1] != dim(unique(gg$data[,c(gg[[i]]), drop = FALSE]))[1]) {
          for (g in gg$geoms) {
            if ('weight' %in% names(gg[[g]])) {
              s = "sum"
              v = gg[[g]]$weight
              r$dataCols = c(v)
              r$dataGrouping = gg[[i]]
              break
            } else {
              s = "count"
              v = gg[[i]]
              r$dataGrouping = gg[[i]]
            }
          }
        }
      }
    }
  }
  for (g in gg$geoms) {
    for (i in n) {
      if (i %in% names(gg[[g]])) {
        if (!all(unlist(lapply(gg$data[,c(gg[[g]][[i]]), drop = FALSE],is.numeric)))) {
          s = "count"
          v = gg[[g]][[i]]
          r$dataGrouping = gg[[g]][[i]]
        }
      }
    }
  }
  if (s == "sum" || s == "count") {
    r$dataColsSummary = v
  }
  r$dataSummary = s
  r
}

cxplot <- function (o) {
  
  library(ggplot2)
  library(dplyr)
  library(canvasXpress)
  
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
    } else if (g == "GeomPoint") {
      cx = gg_append(cx, cx_geom_point(gg, cx))
    }
  }
  cx = gg_append(cx, cx_data(gg, cx))
  cx = gg_append(cx, cx_axes(gg, cx))
  cx = gg_append(cx, cx_facet(gg, cx))
  #print(cx)
  
  print(o)
  print (do.call(canvasXpress, cx))
}
