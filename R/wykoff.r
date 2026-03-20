#' Function of the Wykoff model, based
#' upon two parameters and a single predictor variable as
#' follows
#' \deqn{y_i= \mathrm{e}^{\left(\alpha+\frac{\beta}{x_i+1} \right)},
#' }
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively, for the *i*-th
#' observation; and the rest are parameters (i.e., coefficients).
#'
#' @title A function having the mathematical expression of
#' the Wykoff model.
#' @param x is the predictor variable.
#' @param alpha is the coefficient-parameter  \eqn{\alpha}.
#' @param beta is the  coefficient-parameter  \eqn{\beta}.
#' @param upsilon is an optional constant term that force the prediction
#' of *y* when *x=0*. Thus, the new model becomes
#' \eqn{ y_i = \Upsilon+ f\left(x_i,\mathbf{\theta}\right)}, where
#' \eqn{\mathbf{\theta}} is the vector of coefficients of
#' the above described function represented by
#' \eqn{f(\cdot)}. The default
#' value for \eqn{\Upsilon} is 0.
#'
#' @return Returns the response variable based upon
#' the predictor variable and the coefficients. 
#' @author Christian Salas-Eljatib.
#' @references
#' - Wykoff WR, NL Crookston, AR Stage. 1982. User’s guide to the
#' Stand Prognosis Model. USDA For. Serv. Gen. Tech. Rep.
#' INT-133, USA. 112 p.
#' - Salas-Eljatib C. 2025. Funciones alométricas: reparametrizaciones
#' y características matemáticas. Documento de trabajo No. 1,
#' Serie: Cuadernos de biometría, Laboratorio de Biometría y
#' Modelación Forestal, Universidad de Chile. Santiago, Chile. 51 p.
#' \url{https://biometriaforestal.uchile.cl}
#' @examples
#' # Predictor variable values to be used
#' d<-seq(5,60,by=0.01)
#' # Using the function
#' h<-wykoff.fx(x=d,alpha=3.87,beta=4.38,upsilon=1.3)
#' plot(d,h,type="l")
#'  
#' @rdname wykoff.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
wykoff.fx <- function(x, alpha, beta, upsilon=0){
    upsilon+ exp((alpha-(beta/(1+x)))) 
}
