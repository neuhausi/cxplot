cx_data <- function(gg, cx) {
  ## Build the CanvasXpress Data
  data = gg$data[,names(gg$data) %in% gg$dataCols, drop = FALSE]
  if (!is.null(gg$dataRows)) {
    row.names(data) = gg$dataRows
  }
  ## Add counts if summary is count
  s = gg$dataSummary
  if (gg$dataSummary == 'count' && is.null(gg$dataCols)) {
    data$count <- 1
  } else if (gg$dataSummary == 'count') {
    s = 'raw'
  }
  ## Build Annotation dataframe
  annot = gg$data[,!names(gg$data) %in% gg$dataCols, drop = FALSE]
  if (!is.null(gg$dataRows)) {
    annot = annot[,!names(annot) %in% gg$dataRowsName, drop = FALSE]
    row.names(annot) = gg$dataRows
  }
  if (cx$graphType %in% c('Scatter2D', 'ScatterBubble2D', 'Scatter3D')) {
    r = list(
      data = data,
      varAnnot = annot
    )
  } else {
    r = list(
      data = t(data),
      smpAnnot = t(annot)
    )
  }
  ## String Factors
  if (!is.null(gg$stringFactors)) {
    r$stringSampleFactors = as.list(gg$stringFactors)
    r$sortOnGrouping = "ascending"
  }
  ## Grouping of data
  if (!is.null(gg$dataGrouping)) {
    r$groupingFactors = as.list(gg$dataGrouping)
    r$sortOnGrouping = "ascending"
  }
  ## Color, Shape, Size attributes
  for (g in gg$geoms) {
    if (!is.null(gg[[g]]$colour) || !is.null(gg[[g]]$fill)) {
      if (!is.null(gg[[g]]$colour)) {
        if (gg[[g]]$colour %in% names(gg$data)) {
          r$colorBy = gg[[g]]$colour
          r$useOpenShapes = TRUE
        }
      } else {
        if (gg[[g]]$fill %in% names(gg$data)) {
          r$colorBy = gg[[g]]$fill
        }      
      }
    }
    if (!is.null(gg[[g]]$shape)) {
      if (gg[[g]]$shape %in% names(gg$data)) {
        r$shapeBy = gg[[g]]$shape
      }
    }
    if (!is.null(gg[[g]]$size)) {
      if (gg[[g]]$size %in% names(gg$data)) {
        r$sizeBy = gg[[g]]$size
      }
    }
    if (g == "GeomLine" && !is.null(gg$group)) {
      r$lineBy = gg$group
    }
    if (!('jitter' %in% names(r)) && gg[[g]]$position == "normal") {
      r$jitter = FALSE
    } else if (gg[[g]]$position == "jitter") {
      r$jitter = TRUE
    }
  }
  ## Data Summary Type
  r$summaryType = s
  ## Data Min and Max
  if (!is.null(gg$setMinX)) {
    r$setMinX = gg$setMinX
  }
  if (!is.null(gg$setMaxX)) {
    r$setMaxX = gg$setMaxX
  }  
  if (!is.null(gg$setMinY)) {
    r$setMinY = gg$setMinY
  }
  if (!is.null(gg$setMaxY)) {
    r$setMaxY = gg$setMaxY
  }
  r
}