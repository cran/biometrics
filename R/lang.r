#' Function of the Langhmuir model, based
#' upon two parameters, and a single predictor variable, as
#' follows
#' \deqn{y_i= \alpha \left(\frac{1}{1+\frac{1}{\beta x_i}}\right),}
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively, for the *i*-th observation;  
#'  and the rest are parameters (i.e., coefficients). Further details
#' of this function can be found in Salas-Eljatib (2025).
#'
#' @title Function to computes the result of the Curtis's allometric
#' model.
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
#' - Khayyun TS, Mseer AH. 2019. Comparison of the experimental
#' results with the Langmuir and Freundlich models for copper removal
#' on limestone adsorbent. Applied Water Science 9(8):170.
#' - Salas-Eljatib C. 2025. Funciones alométricas: reparametrizaciones
#' y características matemáticas. Documento de trabajo No. 1,
#' Serie: Cuadernos de biometría, Laboratorio de Biometría y
#' Modelación Forestal, Universidad de Chile. Santiago, Chile. 51 p.
#' \url{https://biometriaforestal.uchile.cl}
#' @examples
#' # Predictor variable values to be used
#' time<-seq(.1,60,by=0.01)
#' # Using the function
#' y<-lang.fx(x=time, a=37,b=0.05)
#' plot(time,y,type="l")
#'  
#' @rdname lang.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
lang.fx <- function(x, a=alpha, b=beta, phi=0){
    alpha<-a;beta<-b;    
    phi+ alpha*(1/(1+(1/(beta*x))))
}
