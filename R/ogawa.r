#' Function of the Ogawa allometric
#' model, based upon parameters (i.e., coefficients) and a variable,
#' as defined by the mathematical expression
#' \deqn{{y_i}= \left(\frac{1}{\alpha}
#' + \frac{1}{\beta {x_i}^{\gamma}}\right)^{-1},
#' }
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively, for the *i*-th observation;  
#'  and the rest are parameters (i.e., coefficients).
#' Further details on this function can be found in
#' Salas-Eljatib (2025).
#'
#' @title Function that computes the result of the Ogawa allometric
#' model.
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
#' @return Returns the inverse of the response variable based upon
#' the predictor variable and the coefficients shown above. 
#' @author Christian Salas-Eljatib.
#' @references
#' - Kohyama T, T Hara, T Tadaki. 1990. Patterns of trunk diameter,
#' tree height and crown depth in crowded abies stands. Annals of
#' Botany 65(5):567–574.
#' - Salas-Eljatib C. 2026. Funciones alométricas: reparametrizaciones
#' y características matemáticas. Documento de trabajo No. 1,
#' Serie: Cuadernos de biometría, Laboratorio de Biometría y
#' Modelación Forestal, Universidad de Chile. Santiago, Chile. 53 p.
#' \url{https://biometriaforestal.uchile.cl}
#' @examples
#' # Predictor variable values to be used
#' time<-seq(5,60,by=0.01)
#' # Using the function
#' d<-ogawa.fx(x=time,alpha=22,beta=0.013,gamma=1.13)
#' plot(time,d,type="l")
#'  
#' @rdname ogawa.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
ogawa.fx <- function(x,alpha, beta, gamma, upsilon=0){
#response variable is Y= upsilon+(1/f(param))
    y <- ((1/alpha) + (1/(beta * x^gamma)))^(-1)
    upsilon + y
}
