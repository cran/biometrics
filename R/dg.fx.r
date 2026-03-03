#' Function to compute the diameter of the tree of average basal
#' area (\eqn{D_{\overline{g}}}),
#' which depends on stand density (\eqn{N}) and stand basal area (\eqn{G}).
#' The aforementioned stand diameter is computed as
#' \deqn{D_{\overline{g}} = \sqrt{ \frac{G}{N} \frac{k}{pi}}}
#' where the constant \eqn{k} depends on whether the variables are in the
#'  units of measurement of the metric or imperial system.
#'
#' @title Function to computes the diameter of the tree of average basal area.
#' @param n is stand tree density. By default the unit of measurement
#' is trees/ha, but if the option 'metrics' is set to `FALSE`, the unit is
#' trees/acre.
#' @param g is stand basal area. By default the unit of measurement
#' must be entered in m\eqn{^{2}}{^2}/ha, but if the option 'metrics'
#' is set to `FALSE`, the unit must be ft\eqn{^{2}}{^2}/ha.
#' @param metrics is a logic value, the default is set to `TRUE`,
#' thus both variables must be entered in the metric system, i.e.,
#' \eqn{N} in 'trees/ha', and \eqn{G} in m\eqn{^{2}}{^2}/ha.
#' If metrics is `FALSE`, \eqn{N} must be in
#' trees/acre, and \eqn{G} in ft\eqn{^{2}}{^2}/acre.
#'
#' @return Returns the diameter of the tree of average basal area.
#' @author Christian Salas-Eljatib.
#' @examples
#'
#' ##Using the function
#' dg.fx(n=1000, g=55)
#' dg.fx(n=210, g=160, metrics=FALSE)
#' @rdname dg.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
dg.fx <- function(n=n,g=g,metrics=TRUE){
  if(metrics==TRUE){out<-sqrt((g/n)*((4*10000)/pi))}
  if(metrics==FALSE){out<-sqrt((g/n)*((4*12*12)/pi))}
  return(out)
}
