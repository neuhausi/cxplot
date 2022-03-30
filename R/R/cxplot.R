## Combine parameters from two lists and
##  overwrite parameters in the first one

#' Title
#'
#' @param a
#' @param b
#'
#' @return
#' @export
#'
#' @import ggplot2
#'
#' @examples
#'
gg_append <- function (a, b) {
  l = c(a[setdiff(names(a), names(b))], b)
  l
}

## Facet
#' Title
#'
#' @param o
#'
#' @return
#' @export
#'
#' @examples
gg_facet <- function (o) {
  if (missing(o)) {
    o = ggplot2::last_plot()
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
#' Title
#'
#' @param o
#'
#' @return
#' @export
#'
#' @examples
gg_theme <- function(o) {
  if (missing(o)) {
    o = ggplot2::last_plot()
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
#' Title
#'
#' @param o
#'
#' @return
#' @export
#'
#' @examples
gg_datalimits <- function(o) {
  if (missing(o)) {
    o = ggplot2::last_plot()
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
#' Title
#'
#' @param o
#'
#' @return
#' @export
#'
#' @examples
gg_scalelimits <- function(o) {
  if (missing(o)) {
    o = ggplot2::last_plot()
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
#' Title
#'
#' @param o
#'
#' @return
#' @export
#'
#' @examples
gg_xscale <- function(o) {
  if (missing(o)) {
    o = ggplot2::last_plot()
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
#' Title
#'
#' @param o
#'
#' @return
#' @export
#'
#' @examples
gg_yscale <- function(o) {
  if (missing(o)) {
    o = ggplot2::last_plot()
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
#' Title
#'
#' @param o
#'
#' @return
#' @export
#'
#' @examples
gg_scales <- function (o) {
  if (missing(o)) {
    o = ggplot2::last_plot()
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
#' Title
#'
#' @param o
#'
#' @return
#' @export
#'
#' @examples
gg_labels <- function (o) {
  if (missing(o)) {
    o = ggplot2::last_plot()
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
#' Title
#'
#' @param o
#'
#' @return
#' @export
#'
#' @examples
gg_mapping <- function(o) {
  if (missing(o)) {
    o = ggplot2::last_plot()
  }
  r = list();
  m = c('x', 'y', 'z', 'weight', 'group', 'colour', 'fill', 'size', 'alpha', 'linetype', 'label', 'vjust')
  a = as.vector(NULL)
  s = as.vector(NULL)
  for (i in m) {
    if (!is.null(o$mapping[[i]])) {
      l = as_label(o$mapping[[i]])
      f = regexpr("factor", l)[1]
      if (f > 0) {
        l = stringr::str_replace(stringr::str_replace(l, "factor\\(", ""), "\\)", "")
        s = append(s , l)
        if (!(i %in% c('x', 'y', 'z'))) {
          r[[i]] = l
        } else {
          a = append(a, l)
        }
      } else {
        r[[i]] = l
      }
    }
  }
  if (length(a) > 0) {
    r$dataGrouping = unique(a)
  }
  if (length(s) > 0) {
    r$stringFactors = unique(s)
  }
  r
}

## Layers
#' Title
#'
#' @param o
#'
#' @return
#' @export
#'
#' @examples
gg_layers <- function(o) {
  if (missing(o)) {
    o = ggplot2::last_plot()
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
#' Title
#'
#' @param l
#'
#' @return
#' @export
#'
#' @examples
gg_proc_layer <- function (l) {
  r = list()
  g = as.vector(NULL)
  s = as.vector(NULL)
  if (!is.null(l$mapping)) {
    atts = ls(l$mapping)
    if (length(atts) > 0) {
      for (a in atts) {
        b = as_label(l$mapping[[a]])
        f = regexpr("factor", b)[1]
        if (f > 0) {
          b = stringr::str_replace(stringr::str_replace(b, "factor\\(", ""), "\\)", "")
          s = append(s , b)
          if (!(a %in% c('x', 'y', 'z'))) {
            r[[a]] = b
          }
          g = append(g, b)
        } else {
          r[[a]] = b
        }
      }
    }
  }
  prps = c('aes_params', 'geom_params', 'stat_params', 'position')
  skip = c('compute_panel', 'preserve', 'setup_data', 'setup_params', 'super', 'compute_layer')
  for (p in prps) {
    if (!is.null(l[[p]])) {
      atts = ls(l[[p]])
      if (length(atts) > 0) {
        for (a in atts) {
          if (a %in% skip) {
            next
          }
          b = l[[p]][[a]]
          f = regexpr("factor", b)[1]
          if (is.character(f) && f > 0) {
            b = stringr::str_replace(stringr::str_replace(b, "factor\\(", ""), "\\)", "")
            s = append(s , b)
            r[[a]] = b
            if (a %in% c('colour', 'fill')) {
              g = append(g, b)
            }
          } else {
            r[[a]] = b
          }
        }
      }
      r$geomHistogram = ifelse('binwidth' %in% atts, TRUE, FALSE)
    }
  }
  pos = class(l$position)[1]
  r$position = ifelse(pos == 'PositionJitter', 'jitter', ifelse(pos == 'PositionFill', "filled", ifelse(pos == "PositionStack", 'stacked', 'normal')))
  if (is.data.frame(l$data)) {
    r$data = l$data
  }
  if (length(g) > 0) {
    r$dataGrouping = unique(g)
  }
  if (length(s) > 0) {
    r$stringFactors = unique(s)
  }
  r
}

## Data Columns
#' Title
#'
#' @param gg
#'
#' @return
#' @export
#'
#' @examples
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
#' Title
#'
#' @param gg
#'
#' @return
#' @export
#'
#' @examples
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
#' Title
#'
#' @param gg
#'
#' @return
#' @export
#'
#' @examples
gg_data_summary <- function(gg) {
  n = c('x', 'y', 'z')
  s = "raw"
  v = FALSE
  r = list()
  if(!is.null(gg$dataGrouping)) {
    a = as.vector(gg$dataGrouping)
  } else {
    a = as.vector(NULL)
  }
  if(!is.null(gg$stringFactors)) {
    q = as.vector(gg$stringFactors)
  } else {
    q = as.vector(NULL)
  }
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
    if (!is.null(gg[[g]]$stringFactors)) {
      q = append(q, gg[[g]]$stringFactors)
    }
  }
  for (g in gg$geoms) {
    for (i in c('colour', 'fill')) {
      if (i %in% names(gg[[g]])) {
        if (!is.null(gg$dataCols) && gg[[g]][[i]] %in% colnames(gg$data)) {
        #if (!is.null(gg$dataCols) && gg[[g]][[i]] %in% colnames(gg$data) && !all(unlist(lapply(gg$data[,c(gg[[g]][[i]]), drop = FALSE],is.numeric)))) {
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
  if (length(q) > 0) {
    r$stringFactors = unique(q)
  }
  r$dataSummary = s
  r
}

#' cxplot
#'
#' Initializes a cxplot object.
#'
#' It can be used to declare the input data frame for a graphic, to specify the set of plot aesthetics intended to be
#' common throughout all subsequent layers unless specifically overridden and custom mouse events.
#'
#' `cxplot()` is used to construct the initial plot object, and is almost always followed by cxp. to add component to the
#' plot. There are three common ways to invoke `cxplot()`:
#'
#' `cxplot("targetId", df, aes("x", "y"))`
#'
#' `cxplot("targetId", df)`
#'
#' The first method is recommended if all layers use the same data and the same set of aesthetics, although this method
#' can also be used to add a layer using data from another data frame. See the first example below. The second method
#' specifies the default data frame to use for the plot, but no aesthetics are defined up front. This is useful when
#' one data frame is used predominantly as layers are added, but the aesthetics may vary from one layer to another.
#'
#' @param targetId DOM id of the <canvas> element included in the <body> element of the web page where the graph will be rendered.
#' @param data Default dataset to use for plot. If not specified, must be supplied in each layer added to the plot. It can be a link to a coma or tab delimited text file, a json representation of a two dimensional array or a CanvasXpress data obiject.
#' @param mapping Default list of aesthetic mappings to use for plot. If not specified, must be supplied in each layer added to the plot.
#' @param events json object with custom user-defined mouse events. This is optional as there are many out-of-the-box already provided.
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' df = "https://www.cxplot.com/assets/data/mtcars.csv";
#' cxp = cxplot("canvasId", df, aes("wt", "mpg"));
#' cxp.geom_point();
#'
#' df = [["height", "weight"], [5.2, 130], [5.6, 150], [6.0, 200],
#'           [5.8, 180], [5.9, 170], [5.5, 160], [5.7, 175]];
#' cxp = cxplot("canvasId", df, aes("weight", "height"));
#' cxp.geom_point();
#' }

cxplot <- function (o = ggplot2::last_plot()) {

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
    } else if (g == "GeomHistogram") {
      cx = gg_append(cx, cx_geom_histogram(gg, cx))
    } else if (g == "GeomLine") {
      cx = gg_append(cx, cx_geom_line(gg, cx))
    } else if (g == "GeomPath") {
      cx = gg_append(cx, cx_geom_path(gg, cx))
    } else if (g == "GeomPoint" || g == "GeomJitter") {
      cx = gg_append(cx, cx_geom_point(gg, cx))
    } else if (g == "GeomQuantile") {
      cx = gg_append(cx, cx_geom_quantile(gg, cx))
    } else if (g == "GeomRaster") {
      cx = gg_append(cx, cx_geom_raster(gg, cx))
    } else if (g == "GeomRug") {
      cx = gg_append(cx, cx_geom_rug(gg, cx))
    } else if (g == 'GeomSmooth') {
      cx = gg_append(cx, cx_geom_smooth(gg, cx))
    } else if (g == "GeomText") {
      cx = gg_append(cx, cx_geom_text(gg, cx))
    } else if (g == "GeomViolin") {
      cx = gg_append(cx, cx_geom_violin(gg, cx))
    }
  }
  cx = gg_append(cx, cx_data(gg, cx))
  cx = gg_append(cx, cx_axes(gg, cx))
  cx = gg_append(cx, cx_theme(gg, cx))
  cx = gg_append(cx, cx_facet(gg, cx))
  #print(cx)

  print(o)
  print (do.call(canvasXpress::canvasXpress, cx))
}
