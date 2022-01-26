## HLine VLine AbLine
cx_geom_rug <- function(gg, g) {
  r = list()
  s = gg$GeomRug$sides
  bt = regexpr("b", s)[1]
  lf = regexpr("l", s)[1]
  tp = regexpr("t", s)[1]
  rg = regexpr("r", s)[1]
  if (bt > 0 && tp > 0) {
    r$xAxisRugShow = TRUE
    r$xAxisRugPosition = 'both'
  } else if (bt > 0) {
    r$xAxisRugShow = TRUE
    r$xAxisRugPosition = 'bottom'    
  } else if (tp > 0) {
    r$xAxisRugShow = TRUE
    r$xAxisRugPosition = 'top'    
  }
  if (lf > 0 && rg > 0) {
    r$yAxisRugShow = TRUE
    r$yAxisRugPosition = 'both'    
  } else if (lf > 0) {
    r$yAxisRugShow = TRUE
    r$yAxisRugPosition = 'left'     
  } else if (rg > 0) {
    r$yAxisRugShow = TRUE
    r$yAxisRugPosition = 'right'     
  }  
  r
}
