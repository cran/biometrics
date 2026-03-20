#' Function of the Michaelis-Menten model, based
#' upon two parameters and a single predictor variable as
#' follows
#' \deqn{y_i= \alpha
#' \left(\frac{x_i}{\beta+x_i} \right),
#' }
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively, for the *i*-th observation;  
#'  and the rest are parameters (i.e., coefficients).
#'
#' @title A function having the mathematical expression of
#' the Michaelis-Menten model.
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
#' - Michaelis L, ML Menten. 1913. Die kinetik der invertinwirkung.
#' Biochemische Zeitschrift 49:333–369.
#' - Salas-Eljatib C, P Corvalán, N Pino, PJ Donoso, DP Soto.
#' 2019. Modelos de efectos mixtos de altura-diámetro para
#' _Drimys winteri_ en el sur (41-43 S) de Chile.
#' Bosque 40(1):71-80.
#' - Salas-Eljatib C. 2025. Funciones alométricas: reparametrizaciones
#' y características matemáticas. Documento de trabajo No. 1,
#' Serie: Cuadernos de biometría, Laboratorio de Biometría y
#' Modelación Forestal, Universidad de Chile. Santiago, Chile. 51 p.
#' \url{https://biometriaforestal.uchile.cl}
#' @examples
#' # Predictor variable values to be used
#' time<-seq(5,60,by=0.01)
#' # Using the function
#' y<-mmenten.fx(x=time,alpha=30,beta=13)
#' plot(time,y,type="l")
#'  
#' @rdname mmenten.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
mmenten.fx <- function(x, alpha, beta,  upsilon=0){
     upsilon+ (alpha*x)/(beta+x) 
}
