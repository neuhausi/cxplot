## HLine VLine AbLine
#' Title
#'
#' @param gg
#' @param g
#'
#' @return
#' @export
#'
#' @examples
cx_geom_xline <- function(gg, g) {
  f = gg$facet
  i = ifelse(g == 'GeomHline', 'yintercept', ifelse(g == 'GeomVline', 'xintercept', 'intercept'))
  s = ifelse(g == 'GeomAbline', 'slope', FALSE)
  l = gg[g]
  dt = l[[g]]$data
  cl = ifelse(!is.null(l$colour), l$colour, 'black')
  w = ifelse(!is.null(l$size), l$size, 1)
  if (!is.null(dt[[i]])) {
    v1 =  dt[[i]]
  } else {
    v1 = dt[[l[[g]][[i]]]]
  }
  if (s != FALSE) {
    if (!is.null(dt[[s]])) {
      v2 =  dt[[s]]
    } else {
      v2 = dt[[l[[g]][[s]]]]
    }
  }
  if (!is.null(f)) {
    v3 = dt[[ f ]]
  } else {
    v3 = FALSE
  }
  d = as.vector(NULL)
  for (j in 1:length(v1)) {
    if (g == 'GeomHline') {
      d = append(d, list(list(y = v1[j], color = cl, width = w, scope = ifelse(!is.null(f), v3[j], FALSE))))
    } else if (g == 'GeomVline') {
      d = append(d, list(list(x = v1[j], color = cl, width = w, scope = ifelse(!is.null(f), v3[j], FALSE))))
    } else {
      d = append(d, list(list(intercept = v1[j], slope = v2[j], color = cl, width = w, scope = ifelse(!is.null(f), v3[j], FALSE))))
    }
  }
  if (g == 'GeomAbline') {
    d = list(reg = as.list(d))
  } else {
    d = list(line = as.list(d))
  }
  r = list(
    decorations = d
  )
  r
}
