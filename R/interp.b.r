#' Linear interpolation 
#'
#' Linear interpolation for three data of x and y only works if the second y is missing.
#' @title Linear interpolation for three data of x and y only works if the second y is missing.
#' @param xs Vector number of size 3
#' @param ys Vector number of size 3, with second position empty or NA
#'
#' @return Output description (simple).
#' @author Christian Salas.
#' @examples
#' x<-c(1,2,3)
#' y<-c(4,NA,6)
#' interp.b(x,y)
#' @rdname interp.b 
#' @export
interp.b<-function(xs,ys){
 	x.a=xs[1]
 	x.b=xs[2]
 	x.c=xs[3]
 	y.a=ys[1] #ys[1]
 	y.b= #ys[2]
 	y.c=ys[3]
 	part.a=(x.c-x.b)*(y.c-y.a)
 	part.b=(x.c-x.a)
 	output=y.c - (part.a/part.b)
 	output
}
