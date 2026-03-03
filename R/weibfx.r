#' Function of the Weibull allometric model, based
#' upon three parameters and a single predictor variable as
#' follows
#' \deqn{y_i= \alpha
#' \left( 1-\mathrm{e}^{-\beta {x_i}}\right)^{\gamma},
#' }
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively, for the *i*-th observation;  
#'  and the rest are parameters (i.e., coefficients).
#'
#' @title A function having the mathematical expression of
#' the Weibull allometric model.
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
#' - Weibull W. 1951. A statistical distribution function of
#' wide applicability. J. Appl. Mech.-Trans. ASME 18(3):293-297.
#' - Yang RC, A Kozak, JH Smith. 1978. The potential of
#' Weibull-type functions as flexible growth curves.
#' Can. J. For. Res. 8(2):424-431.
#' - Salas-Eljatib C. 2025. Funciones alométricas: reparametrizaciones
#' y características matemáticas. Documento de trabajo No. 1,
#' Serie: Cuadernos de biometría, Laboratorio de Biometría y
#' Modelación Forestal, Universidad de Chile. Santiago, Chile. 51 p.
#' \url{https://biometriaforestal.uchile.cl}
#' @examples
#' # Predictor variable values to be used
#' time<-seq(5,60,by=0.01)
#' # Using the function
#' y<-weib.fx(x=time,a=23.06,b=.13,c=.63)
#' plot(time,y,type="l")
#'  
#' @rdname weib.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
weib.fx <- function(x, a=alpha, b=beta, c=gamma, phi=0){
    alpha<-a;beta<-b;gamma<-c
    phi+ alpha*(1-exp(-beta*(x^gamma))) 
}
