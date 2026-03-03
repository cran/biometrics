#' Estimates the parameters of the Weibull probability density
#' function based on the method of moments. It is based on the
#' 2-parameter reparemetrization of the function, i.e., the
#' `shape` and `scale` parameters.
#'
#' @details Althought the original function was written by
#' Dr Oscar García, and the corresponding reference is provided,
#' the current function has some changes to make it of a
#' broader use.
#'
#' @title Function to estimates the parameters of the Weibull
#' probability density function using the method of moments
#' @param y a vector having the randon variable values.
#'
#' @return The main output is a list with the two
#' estimated parameters and the number of observations being used
#' for estimating the parameters.
#'
#' @author Dr Oscar García and Christian Salas-Eljatib.
#' @references
#' - García, O. 1981. Simplified method-of-moments estimation for
#' the Weibull distribution. New Zealand Journal of
#' Forestry Science 11(3): 304-306.
#'
#' @examples
#'
#' # Random variable to be studied
#' library(datana)
#' yvar<-llancahue$dbh
#' summary(yvar)
#' hist(yvar)
#' # Using the  function
#' mmweibull(y=yvar)
#' @rdname mmweibull
#' @export
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
mmweibull <- function(y){
    y<-na.omit(y); n<-length(y)
    m.y<-mean(y);sd.y<-sd(y);cv<-sd.y/m.y;cv
 if (cv > 1.2 || cv <= 0)
    stop("Out of range")
  alpha <- 1 / (cv * (((((0.007454537 * cv * cv - 0.08354348) * cv + 0.153109251) *
                        cv - 0.001946641) * cv - 0.22000991) * (1 - cv) * (1 - cv) + 1))
   beta<- m.y / gamma(1 + 1/alpha)
  list(shape = alpha, scale = beta, n=n)
}

