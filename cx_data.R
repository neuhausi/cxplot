cx_data <- function(gg, cx) {
  ## Build the CanvasXpress Data
  data = gg$data[,names(gg$data) %in% gg$dataCols, drop = FALSE]
  if (!is.null(gg$dataRows)) {
    row.names(data) = gg$dataRows
  }
  ## Add counts if summary is count
  if (gg$dataSummary == 'count') {
    data$count <- 1
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
  if (!is.null(gg$dataGrouping)) {
    r$groupingFactors = list(gg$dataGrouping)
    r$sortOnGrouping = TRUE
  }
  r$summaryType = gg$dataSummary
  r
}