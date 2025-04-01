#' Computes basal area of any given tree. Actually provides the area for a given circle of radius x.
#'
#' No details are given
#' 
#' @title Computes basal area of any given tree
#' @param x is the vector having tree diameter, in cm
#' @param in.m2 is an indicator variable: 1 to obtain the result in m2 if x was measured
#'   in cm; and 0 to obtain the resulting area in the same units of x.
#' 
#' @return The value of basal area.
#' @author Christian Salas-Eljatib          
#' 
#' 
#' @examples
#' 
#' #Creating an example dataframe
#' dbh<- round(rnorm(4,25,20),1);
#' #Using the function
#' in.m2=1
#' gtree(dbh,in.m2)
#' 
#' @rdname gtree
#' @export
#' 
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
gtree <- function(x,in.m2){
  if(in.m2==1){x^2*(pi/40000)} else {x^2*pi/4}   }                               #