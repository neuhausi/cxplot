#' A box and whiskers plot (in the style of Tukey)
#'
#' The boxplot compactly displays the distribution of a continuous variable. It visualises five summary statistics
#' (the median, two hinges and two whiskers), and all "outlying" points individually.
#
#' @usage
#' geom_boxplot({ "mapping" = null,
#' "data" = null,
#' "stat" = "boxplot",
#' "position" = "dodge2",
#' "...",
#' "outlier.color" = null,
#' "outlier.color" = null,
#' "outlier.fill" = null,
#' "outlier.shape" = 19,
#' "outlier.stroke" = 0.5,
#' "outlier.alpha" = null,
#' "notch" = false,
#' "notchwidth" = 0.5,
#' "varwidth" = false,
#' "na.rm" = false,
#' "orientation" = NA,
#' "show.legend" = NA,
#' "inherit.aes" = true
#' })
#'
#' stat_boxplot({
#'     "mapping" = null,
#'     "data" = null,
#'     "geom" = "boxplot",
#'     "position" = "dodge2",
#'     "...",
#'     "coef" = 1.5,
#'     "na.rm" = false,
#'     "orientation" = NA,
#'     "show.legend" = NA,
#'     "inherit.aes" = true
#' })
#'
#' @param mapping Set of aesthetic mappings created by `aes()` or `aes_()`. If specified and `inherit.aes = TRUE` (the default), it is combined with the default mapping at the top level of the plot. You must supply mapping if there is no plot mapping.
#' @param data The data to be displayed in this layer.
#' @param position Position adjustment, either as a string, or the result of a call to a position adjustment function.
#' @param ... Other arguments passed on to `layer()`. These are often aesthetics, used to set an aesthetic to a fixed value, like `color = "red"` or `size = 3`. They may also be parameters to the paired geom/stat.
#' @param outlier.color,outlier.color,outlier.fill,outlier.shape,outlier.size,outlier.stroke,outlier.alpha Default aesthetics for outliers. Set to NULL to inherit from the aesthetics used for the box. In the unlikely event you specify both US and UK spellings of color, the US spelling will take precedence. Sometimes it can be useful to hide the outliers, for example when overlaying the raw data points on top of the boxplot. Hiding the outliers can be achieved by setting outlier.shape = NA. Importantly, this does not remove the outliers, it only hides them, so the range calculated for the y-axis will be the same with outliers shown and outliers hidden.
#' @param notch If `FALSE` (default) make a standard box plot. If `TRUE`, make a notched box plot. Notches are used to compare groups; if the notches of two boxes do not overlap, this suggests that the medians are significantly different.
#' @param notchwidth For a notched box plot, width of the notch relative to the body (defaults to notchwidth = 0.5).
#' @param varwidth If `FALSE` (default) make a standard box plot. If `TRUE`, boxes are drawn with widths proportional to the square-roots of the number of observations in the groups (possibly weighted, using the weight aesthetic).
#' @param na.rm If `FALSE`, the default, missing values are removed with a warning. If TRUE, missing values are silently removed.
#' @param orientation The orientation of the layer. The default (NA) automatically determines the orientation from the aesthetic mapping. In the rare event that this fails it can be given explicitly by setting orientation to either "x" or "y". See the Orientation section for more detail.
#' @param show.legend logical. Should this layer be included in the legends? NA, the default, includes if any aesthetics are mapped. FALSE never includes, and TRUE always includes. It can also be a named logical vector to finely select the aesthetics to display.
#' @param inherit.aes If FALSE, overrides the default aesthetics, rather than combining with them. This is most useful for helper functions that define both data and aesthetics and shouldn't inherit behaviour from the default plot specification, e.g. borders().
#' @param geom, stat Use to override the default connection between `geom_boxplot()` and `stat_boxplot()`.
#' @param coef Length of the whiskers as multiple of IQR. Defaults to 1.5.
#'
#' @param gg
#' @param cx
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' cxp = cxplot("canvas1", mpg, aes("class", "hwy"));
#' cxp.geom_boxplot();
#'
#' cxp = cxplot("canvas2", mpg, aes("hwy", "class"));
#' cxp.geom_boxplot();
#'
#' cxp = cxplot("canvas3", mpg, aes("class", "hwy"));
#' cxp.geom_boxplot({"notch": true});
#'
#' cxp = cxplot("canvas4", mpg, aes("class", "hwy"));
#' cxp.geom_boxplot({"fill": "white", "color": "#3366FF"});
#'}
#' @references
#' McGill, R., Tukey, J. W. and Larsen, W. A. (1978) Variations of box plots. The American Statistician 32, 12-16.



cx_geom_boxplot <- function(gg, cx) {
  r = list(
    graphType = "Boxplot"
  )
  if (!is.null(gg$GeomBoxplot$notch)) {
    r$boxplotNotched = gg$GeomBoxplot$notch
  }
  if ("GeomPoint" %in% gg$geoms) {
    r$showBoxplotOriginalData = TRUE
  }
  if (!is.null(gg$y) && !(gg$y %in% gg$dataCols)) {
    r$graphOrientation = 'horizontal'
  } else {
    r$graphOrientation = 'vertical'
  }
  r
}
