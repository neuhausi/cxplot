#' Geom Bar
#'
#' Generate a CanvasXpress Barplot.
#'
#' There are two types of bar charts: geom_bar() and geom_col(). geom_bar() makes the height of the bar proportional
#' to the number of cases in each group (or if the weight aesthetic is supplied, the sum of the weights). If you
#' want the heights of the bars to represent values in the data, use geom_col() instead. geom_bar() uses stat_count()
#' by default: it counts the number of cases at each x position. geom_col() uses stat_identity(): it leaves the data
#' as is.
#'
#'
#' @usage
#'geom_bar({
#' "mapping" = null,
#' "data" = null,
#' "stat" = "count",
#' "position" = "stack","...",
#' "width" = null,
#' "na.rm" = false,
#' "orientation" = NA,
#' "show.legend" = NA,
#' "inherit.aes" = true})
#'
#' geom_col({
#' "mapping" = null,
#' "data" = null,
#' "position" = "stack",
#' "...",
#' "width" = null,
#' "na.rm" = false,
#' "show.legend" = NA,
#' "inherit.aes" = true
#' })
#'
#' stat_count({
#'     "mapping" = null,
#'     "data" = null,
#'     "geom" = "bar",
#'     "position" = "stack",
#'     "...",
#'     "width" = null,
#'     "na.rm" = false,
#'     "orientation" = NA,
#'     "show.legend" = NA,
#'     "inherit.aes" = true
#' })
#'
#'
#' @param gg
#' @param cx
#'
#'
#'
#' @return CanvasXpress Barplot
#' @export
#'
#' @examples
#'
#' // Generate a simple bar plot
#' var cxp = new cxplot("canvas1", mpg, aes("class"))
#' cxp.geom_bar()
#'
#' // geom_bar is designed to make it easy to create bar charts that show
#' // counts (or sums of weights)
#' var cxp = new cxplot("canvas1", mpg, aes("class"));
#' // Number of cars in each class:
#'     cxp.geom_bar();
#'
#' // Total engine displacement of each class
#' var cxp = new cxplot("canvas2", mpg, aes("class"));
#' // Number of cars in each class:
#'     cxp.geom_bar(aes({"weight": "displ"}));
#'
#' // Map class to y instead to flip the orientation
#' var cxp = new cxplot("canvas3", mpg, aes({"y": "class"}));
#' // Number of cars in each class:
#'     cxp.geom_bar();
#'
#' // Bar charts are automatically stacked when multiple bars are placed
#' // at the same location. The order of the fill is designed to match
#' // the legend
#' var cxp = new cxplot("canvas4", mpg, aes("class"));
#' // Number of cars in each class:
#'     cxp.geom_bar(aes({"fill": "drv"}));
#'
#' // If you need to flip the order (because you've flipped the orientation)
#' // call position_stack() explicitly:
#'     var cxp = new cxplot("canvas5", mpg, aes({"y": "class"}));
#' // Number of cars in each class:
#'     cxp.geom_bar(aes({"fill": "drv", "position": "reverse"}));
#' //cxp.theme({"legend.position": "top"});

cx_geom_bar <- function(gg, cx) {
  if (!isFALSE(gg$GeomBar$geomHistogram)) {
    cx_geom_histogram(gg, cx)
  } else {
    r = list(
      graphType = "Bar"
    )
    if (!is.null(gg$GeomBar$colour) || !is.null(gg$GeomBar$fill)) {
      r$stackBy = ifelse(!is.null(gg$GeomBar$colour), gg$GeomBar$colour, gg$GeomBar$fill)
    }
    if ((!is.null(gg$GeomBar$y) && !(gg$GeomBar$y %in% gg$dataCols)) || ((is.null(gg$x) || gg$x == 'count') && !is.null(gg$y) && !(gg$y %in% gg$dataCols))) {
      r$graphOrientation = 'horizontal'
    } else {
      r$graphOrientation = 'vertical'
    }
    r
  }
}

