#' A simple linear interpolation function applicable to two vectors
#' (e.g., \eqn{X} and \eqn{Y}) of length three, suitable when the second
#' element of \eqn{Y} is missing.
#'
#' @title A simple linear interpolation function applicable to two vectors
#'  (\eqn{X} and \eqn{Y}), when the second element of \eqn{Y} is missing.
#' @param xs A numeric vector of length 3.
#' @param ys A numeric vector of length 3, with the second position empty.
#'
#' @return The interpolated value for the second element of vector \eqn{Y}.
#'
#' @author Christian Salas-Eljatib.
#' @examples
#' x<-c(0.2,0.8,1.3)
#' y<-c(48,NA,41)
#' interpy2(xs=x,ys=y)
#' @rdname interpy2
#' @export
interpy2<- function(xs=xs,ys=ys){
        x.a=xs[1]
        x.b=xs[2]
        x.c=xs[3]
        y.a=ys[1] #ys[1]
        y.b= #ys[2]
        y.c=ys[3]
        part.a=(x.c-x.b)*(y.c-y.a)
        part.b=(x.c-x.a)
        output=y.c - (part.a/part.b)
        return(output)
}
