## gg_facet
#'
#' @param ggplot object
#'
#' @return list
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

#' gg_theme
#'
#' @param ggplot object
#'
#' @return list
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
      if (is.list(o$theme[[a]])) {
        atts2 = ls(o$theme[[a]])
        for (b in atts2) {
          v = as.character(o$theme[[a]][[b]])
          if (length(v) > 0) {
            t[[paste(a,b,sep=".")]] = v
          }
        }
      } else {
        v = as.character(o$theme[[a]])
        if (length(v) > 0) {
          t[[a]] = v
        }
      }
    }
  }
  t
}

#' gg_xscale
#'
#' @param ggplot object
#'
#' @return list
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

#' gg_yscale
#'
#' @param ggplot object
#'
#' @return list
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

#' gg_scales
#'
#' @param ggplot object
#'
#' @return list
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

#' gg_labels
#'
#' @param ggplot object
#'
#' @return list
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

#' gg_mapping
#'
#' @param ggplot object
#'
#' @return list
#' @export
#'
#' @examples
gg_mapping <- function(o) {
  if (missing(o)) {
    o = ggplot2::last_plot()
  }
  r = list();
  m = c('x', 'y', 'z', 'weight', 'group', 'colour', 'fill', 'size', 'alpha', 'linetype', 'label', 'vjust')
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
          r[[i]] = l
        }
      } else {
        r[[i]] = l
      }
    }
  }
  if (length(s) > 0) {
    r$stringVariableFactors = unique(s)
    r$stringSampleFactors = unique(s)
    r$asVariableFactors = unique(s)
    r$asSampleFactors = unique(s)
  }
  r
}

#' gg_proc_layer
#'
#' @param layer
#'
#' @return list
#' @export
#'
#' @examples
gg_proc_layer <- function (l) {
  r = list()
  q = as.vector(NULL)
  if (!is.null(l$mapping)) {
    atts = ls(l$mapping)
    if (length(atts) > 0) {
      for (a in atts) {
        b = as_label(l$mapping[[a]])
        f = regexpr("factor", b)[1]
        s = regexpr("after_", b)[1]
        t = regexpr("stage", b)[1]
        if (s > 0 || t > 0) {
          next 
        }
        if (f > 0) {
          b = stringr::str_replace(stringr::str_replace(b, "factor\\(", ""), "\\)", "")
          q = append(q, b)
          if (!(a %in% c('x', 'y', 'z'))) {
            r[[a]] = b
          }
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
          if (a == "na.rm" && !l[[p]][[a]]) {
            next
          }
          b = l[[p]][[a]]
          f = regexpr("factor", b)[1]
          if (is.character(f) && f > 0) {
            b = stringr::str_replace(stringr::str_replace(b, "factor\\(", ""), "\\)", "")
          }
          r[[a]] = b
        }
      }
      if ('binwidth' %in% atts) {
        r$geomHistogram = TRUE
      }
    }
  }
  if (length(q) > 0) {
    r$stringVariableFactors = unique(q)
    r$stringSampleFactors = unique(q)
    r$asVariableFactors = unique(q)
    r$asSampleFactors = unique(q)
  }
  pos = class(l$position)[1]
  pos = ifelse(pos == 'PositionJitter', 'jitter', ifelse(pos == 'PositionFill', "filled", ifelse(pos == "PositionStack", 'stacked', 'normal')))
  if (pos != 'normal') {
    r$position = pos
  }
  if (is.data.frame(l$data)) {
    r$data = data_to_matrix(l$data)
  }
  r
}

#' data_to_matrix
#'
#' @param dataframe
#'
#' Convert a dataframe to a 2D matrix
#' 
#' @return matrix
#' @export
#'
#' @examples
data_to_matrix <- function(d) {
  nd = rbind(colnames(d), d)
  nd = tibble::add_column(nd, Id = row.names(nd), .before = 1)
  #nd[1,1] = "Id"
  as.matrix(nd)
}

#' ggplot.as.list
#'
#' @param ggplot object
#'
#' Convert a ggplot object to a list
#' 
#' @return list
#' @export
#'
#' @examples

ggplot.as.list <- function (o = ggplot2::last_plot(), target) {

  if (!("ggplot") %in% class(o)) {
    stop("Not a ggplot object")
  }
  if(missing(target)) {
    target = "canvas"
  }

  ## Convert ggplot object to list

  cx = list(
    renderTo = target,
    data = data_to_matrix(o$data),
    aes = gg_mapping(o),
    scales = gg_scales(o),  
    theme = gg_theme(o),
    labels = gg_labels(o),
    facet = gg_facet(o),
    layers = as.vector(NULL),
    geoms = as.vector(NULL),
    isGGPlot = TRUE
  )
  
  layers = sapply(o$layers, function(x) class(x$geom)[1])
  
  for (i in 1:length(layers)) {
    g = layers[i]
    l = gg_proc_layer(o$layers[[i]])
    q = list()
    q[[g]] = l
    cx$geoms = append(cx$geoms, g)
    cx$layers = append(cx$layers, q)
  }
  cx
  #jsonlite::toJSON(cx, pretty = TRUE, auto_unbox = TRUE)

}

