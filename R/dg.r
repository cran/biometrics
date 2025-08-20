#' Function to compute the diameter of the tree of average basal
#' area (\eqn{D_{\overline{g}}}),
#' which depends on stand density (\eqn{N}) and stand basal area (\eqn{G}).
#' The aforementioned stand diameter is computed as
#' \deqn{D_{\overline{g}} = \sqrt{ \frac{G}{N} \frac{k}{pi}}}
#' where the constant \eqn{k} depends on whether the variables are in the
#'  units of measurement of the metric or imperial system.
#'
#' @title Function to computes the diameter of the tree of average basal area.
#' @param N is stand tree density. By default the unit of measurement
#' is trees/ha, but if the option 'metrics' is set to `FALSE`, the unit is
#' trees/acre.
#' @param G is stand basal area. By default the unit of measurement
#' must be entered in m\eqn{^{2}}{^2}/ha, but if the option 'metrics'
#' is set to `FALSE`, the unit must be ft\eqn{^{2}}{^2}/ha.
#' @param metrics is a logic value, the default is to `TRUE`, thus \eqn{N} has to
#'  be entered in the unit 'trees/ha', and \eqn{G} must be entered
#'   in m\eqn{^{2}}{^2}/ha. If metrics is `FALSE`, \eqn{N} must be entered in
#' trees/acre, and \eqn{G} in ft\eqn{^{2}}{^2}/ha.
#'
#' @return Returns the diameter of the tree of average basal area.
#' @author Christian Salas-Eljatib.
#' @examples
#'
#' ##Using the function
#' dg(N=1000, G=55)
#' dg(N=210, G=160, metrics=FALSE)
#' @rdname dg
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
dg <- function(N=N,G=G,metrics=TRUE){
  if(metrics==TRUE){out<-sqrt((G/N)*(40000/pi))}
  if(metrics==FALSE){out<-sqrt((G/N)*((4*144)/pi))}
  return(out)
  }
