#' Function of the Sibbesen model, based
#' upon three parameters and a single predictor variable as
#' follows
#' \deqn{y_i= \alpha \left( {x_i}  \right)^{{-\beta x_i}^{-\gamma}},}
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively, for the *i*-th observation;
#' and the rest are parameters (i.e., coefficients).
#'
#' @title A function having the mathematical expression of
#' the Sibbesen model.
#' @param x is the predictor variable.
#' @param alpha is the coefficient-parameter  \eqn{\alpha}.
#' @param beta is the  coefficient-parameter  \eqn{\beta}.
#' @param gamma is the  coefficient-parameter  \eqn{\gamma}.
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
#' - Sibbesen E. 1981. Some new equations to describe phosphate
#' sorption by soils. Journal of Soil Science 32:67-74.
#' - Salas-Eljatib C. 2025. Funciones alométricas: reparametrizaciones
#' y características matemáticas. Documento de trabajo No. 1,
#' Serie: Cuadernos de biometría, Laboratorio de Biometría y
#' Modelación Forestal, Universidad de Chile. Santiago, Chile. 51 p.
#' \url{https://biometriaforestal.uchile.cl}
#' @examples
#' # Predictor variable values to be used
#' time<-seq(5,60,by=0.01)
#' # Using the function
#' y<-sibbesen.fx(x=time,alpha=32,beta=0.52,gamma=4.83)
#' plot(time,y,type="l")
#'  
#' @rdname sibbesen.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
sibbesen.fx <- function(x, alpha,beta, gamma, upsilon=0){
    upsilon+ (alpha*(x^(-beta*(x^(-gamma)))))
}
