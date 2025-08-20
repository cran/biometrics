#' A simple linear interpolation function applicable to two vectors
#' (e.g., \eqn{X} and \eqn{Y}) of length three, suitable when the first
#' element of \eqn{Y} is missing.
#'
#' @title A simple linear interpolation function applicable to two vectors
#'  (\eqn{X} and \eqn{Y}), when the first element of \eqn{Y} is missing.
#' @param xs A numeric vector of length 3
#' @param ys A numeric vector of length 3, with the first position empty.
#'
#' @return The interpolated value for the first element of vector \eqn{Y}.
#' @author Christian Salas-Eljatib.
#' @examples
#' x<-c(0.2,0.8,1.3)
#' y<-c(NA,41,38)
#' interpy1(xs=x,ys=y)
#' @rdname interpy1
#' @export
interpy1<- function(xs=xs,ys=ys){
 x.a=xs[1]
 x.b=xs[2]
 x.c=xs[3]
 y.a=NA #ys[1]
 y.b=ys[2]
 y.c=ys[3]
 part.a=(x.c-x.a)*(y.c-y.b)
 part.b=(x.c-x.b)
 output=y.c-(part.a/part.b)
 return(output)
}
