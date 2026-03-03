#' Function of the power model, based
#' upon the model parameters, and a single predictor variable as
#' follows
#' \deqn{ y_i = \alpha x_i^{\beta} }
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively for the *i*-th observation;  
#'  and the rest are parameters (i.e., coefficients).
#'
#' @title Function to computes the result of the power model, as a
#' classical allometric functional form.
#' @param x is the predictor variable.
#' @param a is the coefficient-parameter  \eqn{\alpha}.
#' @param b is the  coefficient-parameter  \eqn{\beta}.
#' @param phi is an optional constant term that force the prediction
#' of *y* when *x=0*. Thus, the new model becomes
#' \eqn{ y_i = \phi+ f(x_i,\mathbf{\theta})}, where
#' \eqn{\mathbf{\theta}} is the vector of coefficients of
#' the above described function represented by
#' \eqn{f(\cdot)}. The default
#' value for \eqn{\phi} is 0.
#'
#' @return Returns the response variable based upon
#' the predictor variable and the coefficients. 
#' @author Christian Salas-Eljatib.
#' @references
#' - Salas-Eljatib C. 2025. Funciones alométricas: reparametrizaciones
#' y características matemáticas. Documento de trabajo No. 1,
#' Serie: Cuadernos de biometría, Laboratorio de Biometría y
#' Modelación Forestal, Universidad de Chile. Santiago, Chile. 51 p.
#' \url{https://biometriaforestal.uchile.cl}
#' @examples
#' # Predictor variable to be used is 30 
#' # Using the function
#' power.fx(x=30,a=2.86,b=.49)
#'  
#' @rdname power.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
power.fx <- function(x, a=alpha, b=beta, phi=0){
    alpha<-a;beta<-b;    
    phi + alpha*(x^beta)
}
