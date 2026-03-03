#' Computes the *U*-estimator for a number of trees per-are
#' (1 ha=100ares)
#'
#' @details Althought the original function was written by
#' Dr Oscar García, and the corresponding reference is provided,
#' the current function has several changes that makes it of a 
#' broader use.
#'
#' @title Function to compute the *U*-estimator for a sorted
#' random variable, measured in a given sample plot.
#' @param sorty a vector having the tree-level variable of interest being
#' already sorted according to a criterion.
#' @param n.per.are number of needed trees per are for the sample plot. Remember that
#' 1 are=100 m2 or 1 ha=100 ares. If `n.per.are` is not an integer, it
#'   is rounded to the nearest integer, with a warning.
#'
#' @return The main output is the *U*-estimator for the random
#' variable of interest.
#'
#' @author Dr Oscar García and Christian Salas-Eljatib.
#' @references
#' - Garcia O, Batho A. 2005. Top height estimation in lodgepole pine
#' sample plots. Western Journal of Applied forestry 20(1):64-68.
#'
#' @examples
#'
#' #Creates a fake dataframe
#' h <- c(29.1,28, 24.5, 26, 21,20.5,20.1);
#' sort.h<-sort(h,decreasing=FALSE);sort.h
#' plot.area.m2<-500;plot.area.ha<-plot.area.m2/10000;plot.area.ha
#' ndom.ha<-100;n.per.are<-plot.area.ha*ndom.ha;
#' # Using the  function
#' uestimator(sort.h,n.per.are)
#' @rdname uestimator
#' @export
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
uestimator <- function(sorty, n.per.are) {
    m <- round(n.per.are)
    if (m != n.per.are) warning("The trees/are = ", n.per.are, " has been rounded")
  sum(choose(0:(length(sorty)-1),m-1)*sorty)/choose(length(sorty),m)
}


