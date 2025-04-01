#' This function computes the quadratic mean diameter of a sample plot.
#'
#' @title Computes the quadratic mean diameter of a sample plot.
#' @param tph is tree density, in trees/ha;
#' @param gha is basal area, in m2/ha
#'
#' @return Returns the quadratic mean diameter (in cm) for a given plot. 
#' @author Christian Salas-Eljatib.
#' @examples
#'
#' #using the function
#' qmd(tph=1023, gha=50)
#' @rdname qmd
#' @export
#' 
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
qmd <- function(tph=tph,gha=gha){sqrt((gha/tph)*(40000/pi))}        
