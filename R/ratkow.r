#' Function of the Ratkowsky allometric
#' model, based upon parameters (i.e., coefficients) and a variable,
#' as defined by the mathematical expression
#' \deqn{y_i= \alpha
#' \mathrm{e}^{\left(\frac{-\beta}{x_i +\gamma}\right)},
#' }
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively, for the *i*-th observation;  
#'  and the rest are parameters (i.e., coefficients).
#' Further details on this function can be found in
#' Salas-Eljatib (2025).
#'
#' @title Function that computes the result of the Ratkowsky
#' allometric model.
#' @param x is the predictor variable.
#' @param a is the coefficient-parameter  \eqn{\alpha}.
#' @param b is the  coefficient-parameter  \eqn{\beta}.
#' @param c is the  coefficient-parameter  \eqn{\gamma}.
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
#' - Zhang L. 1997. Cross-validation of non-linear growth functions
#' for modelling tree height-diameter relationships. Annals of
#' Botany 79(3):251–257.
#' - Salas-Eljatib C. 2025. Funciones alométricas: reparametrizaciones
#' y características matemáticas. Documento de trabajo No. 1,
#' Serie: Cuadernos de biometría, Laboratorio de Biometría y
#' Modelación Forestal, Universidad de Chile. Santiago, Chile. 51 p.
#' \url{https://biometriaforestal.uchile.cl}
#' @examples
#' # Predictor variable values to be used
#' d<-seq(5,60,by=0.01)
#' # Using the function
#' h<-ratkow.fx(x=d,a=28,b=34,c=.85)
#' plot(d,h,type="l")
#'  
#' @rdname ratkow.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
ratkow.fx <- function(x, a=alpha, b=beta, c=gamma, phi=0){
    alpha<-a;beta<-b;gamma<-c    
    phi+ alpha*exp(-beta/(x+gamma))
}
