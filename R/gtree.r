#' The function computes the basal area of a tree (\eqn{g}),
#' which only depends on its diameter at breast-height (\eqn{d}).
#' The basal area of a tree is computed as
#' \deqn{g = \left(\frac{\pi}{k}\right) d^{2}}
#' where the constant \eqn{k} depends on whether the diameter
#' and the resulting basal area are in the units of
#' the metric or imperial system.
#'
#' @title Function to compute basal area of a tree
#' @param x is the object (i.e., vector or scalar) having tree diameter.
#' By default the function assumes that the unit of measurement of
#' this variable is cm.
#' @param metric is a logic value, the default is to `TRUE`, thus the diameter
#' has to be expressed in cm, and the resulting basal area will be expressed
#'  in m\eqn{^{2}}{^2}. If `metric` is `FALSE`, the diameter has to be in inches
#'  and the resulting basal area will be in ft\eqn{^{2}}{^2}.
#'
#' @return The value of basal area in m\eqn{^{2}}{^2} or in ft\eqn{^{2}}{^2},
#' depending on the units of measurement being defined.
#' @author Christian Salas-Eljatib
#'
#'
#' @examples
#'
#' #Using the function
#'  gtree(40)
#'  gtree(x=30)
#' gtree(x=11.81,metric=FALSE)
#'
#' @rdname gtree
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
gtree <- function(x,metric=TRUE){
  if(metric==TRUE){x^2*(pi/40000)} else {
    x^2*(pi/(4*144))}   }                               #
