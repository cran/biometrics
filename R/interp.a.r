#' Linear interpolation 
#'
#' Linear interpolation for three data of x and y only works if the first y is missing.
#' @title Linear interpolation for three data of x and y only works if the first y is missing.
#' @param xs Vector number of size 3
#' @param ys Vector number of size 3, with first position empty or NA
#'
#' @return Output description (simple).
#' @author Christian Salas.
#' @examples
#' x<-c(1,2,3)
#' y<-c(NA,4,6)
#' interp.a(x,y)
#' @rdname interp.a 
#' @export
interp.a<- function(xs,ys){
 x.a=xs[1]
 x.b=xs[2]
 x.c=xs[3]
 y.a=NA #ys[1]
 y.b=ys[2]
 y.c=ys[3]
 part.a=(x.c-x.a)*(y.c-y.b)
 part.b=(x.c-x.b)
 output=y.c-(part.a/part.b)
 output
}
