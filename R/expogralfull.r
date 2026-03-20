#' Function of the fully generalized-exponential allometric
#' model, based upon five  parameters (i.e., coefficients) and a variable,
#' as defined by the mathematical expression
#' \deqn{y_i= 
#' \alpha \mathrm{e}^{\left(\beta +\frac{\gamma}{x_i^{\delta}+\epsilon} \right)},
#' }
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively, for the *i*-th observation;  
#'  and the rest are parameters (i.e., coefficients).
#' Further details on this function can be found in
#' Salas-Eljatib (2025).
#'
#' @title Function that computes the result of the Stage  allometric
#' model.
#' @param x is the predictor variable.
#' @param alpha is the coefficient-parameter  \eqn{\alpha}.
#' @param beta is the  coefficient-parameter  \eqn{\beta}.
#' @param gamma is the  coefficient-parameter  \eqn{\gamma}.
#' @param delta is the  coefficient-parameter  \eqn{\delta}.
#' @param epsilon is the  coefficient-parameter  \eqn{\epsilon}.
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
#' - Salas-Eljatib C. 2025. Funciones alométricas: reparametrizaciones
#' y características matemáticas. Documento de trabajo No. 1,
#' Serie: Cuadernos de biometría, Laboratorio de Biometría y
#' Modelación Forestal, Universidad de Chile. Santiago, Chile. 51 p.
#' \url{https://biometriaforestal.uchile.cl}
#' @examples
#' # Predictor variable values to be used
#' time<-seq(5,60,by=0.01)
#' # Using the function
#' y<-expogralfull.fx(x=time,alpha=20,beta=.1,gamma=10,delta=1,
#' epsilon=1)
#' plot(time,y,type="l",col="red")
#'  
#' @rdname expogralfull.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
expogralfull.fx <- function(x,alpha,beta,gamma,delta,epsilon,upsilon=0){
    deno<-(x^delta)+epsilon
    frac<-gamma/deno
    exp.term<-beta-frac
    upsilon+alpha*exp(exp.term) 
}
