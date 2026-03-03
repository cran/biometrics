#' Function of the Meyer model, based
#' upon two parameters and a single predictor variable as
#' follows
#' \deqn{y_i= \alpha
#' \left(1-\mathrm{e}^{-\beta {x_i}}\right),
#' }
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively, for the *i*-th observation;  
#'  and the rest are parameters (i.e., coefficients).
#'
#' @title A function having the mathematical expression of
#' the Meyer model.
#' @param x is the predictor variable.
#' @param a is the coefficient-parameter  \eqn{\alpha}.
#' @param b is the  coefficient-parameter  \eqn{\beta}.
#' @param phi is an optional constant term that force the prediction
#' of *y* when *x=0*. Thus, the new model becomes
#' \eqn{ y_i = \phi+ f\left(x_i,\mathbf{\theta}\right)}, where
#' \eqn{\mathbf{\theta}} is the vector of coefficients of
#' the above described function represented by
#' \eqn{f(\cdot)}. The default
#' value for \eqn{\phi} is 0.
#'
#' @return Returns the response variable based upon
#' the predictor variable and the coefficients. 
#' @author Christian Salas-Eljatib.
#' @references
#' - Meyer HA. 1940. A mathematical expression for height
#' curves. Journal of Forestry 38(5):415-420.
#' - Salas-Eljatib C. 2025. Funciones alométricas: reparametrizaciones
#' y características matemáticas. Documento de trabajo No. 1,
#' Serie: Cuadernos de biometría, Laboratorio de Biometría y
#' Modelación Forestal, Universidad de Chile. Santiago, Chile. 51 p.
#' \url{https://biometriaforestal.uchile.cl}
#' @examples
#' # Predictor variable values to be used
#' time<-seq(5,60,by=0.01)
#' # Using the function
#' y<-meyer.fx(x=time,a=20,b=.07)
#' plot(time,y,type="l")
#'  
#' @rdname meyer.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
meyer.fx <- function(x, a=alpha, b=beta,phi=0){
    alpha<-a;beta<-b;    
    phi+ alpha*(1-exp(-beta*x)) 
}
