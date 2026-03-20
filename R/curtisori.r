#' Function of the originally proposed allometric model by Curtis,
#' based upon two parameters, and a single predictor variable as
#' follows
#' \deqn{y_i= \frac{x_i}{\alpha +\beta x_i},}
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively for the *i*-th observation;
#' and the rest are parameters (i.e., coefficients). Please read the
#' details on this model in Salas-Eljatib (2025).
#'
#' @title Function to computes the result of the original
#' Curtis's allometric model.
#' @param x is the predictor variable.
#' @param alpha is the coefficient-parameter  \eqn{\alpha}.
#' @param beta is the  coefficient-parameter  \eqn{\beta}.
#' @param upsilon is an optional constant term that force the prediction
#' of *y* when *x=0*. Thus, the new model becomes
#' \eqn{ y_i = \Upsilon+ f(x_i,\mathbf{\theta})}, where
#' \eqn{\mathbf{\theta}} is the vector of coefficients of
#' the above described function represented by
#' \eqn{f(\cdot)}. The default
#' value for \eqn{\Upsilon} is 0.
#'
#' @return Returns the response variable based upon
#' the predictor variable and the coefficients. 
#' @author Christian Salas-Eljatib.
#' @references
#' - Curtis RO. 1967. Height-diameter and height-diameter-age
#' equations for second-growth Douglas-fir. Forest Sci. 13(4):365-375.
#' - Salas-Eljatib C. 2025. Funciones alométricas: reparametrizaciones
#' y características matemáticas. Documento de trabajo No. 1,
#' Serie: Cuadernos de biometría, Laboratorio de Biometría y
#' Modelación Forestal, Universidad de Chile. Santiago, Chile. 51 p.
#' \url{https://biometriaforestal.uchile.cl}
#' @examples
#' # Parameters
#' # Predictor variable values to be used
#' time<-seq(5,60,by=0.01)
#' # Using the function
#' y<-curtisori.fx(x=time,alpha=20,beta=8)
#' plot(time,y,type="l")
#'  
#' @rdname curtisori.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
curtisori.fx <- function(x, alpha, beta, upsilon=0){    
    upsilon+ (x/(alpha+beta*x)) 
}
