#' Function of the Gompertz model, depending on 
#' its three parameters and a variable, defined by the following 
#' mathematical expression 
#' \deqn{y_i= \alpha
#' \mathrm{e}^{\left(-\beta \mathrm{e}^{-\gamma x_i} \right)},
#' }
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively for the *i*-th observation;
#' and the rest are parameters (i.e., coefficients).
#'
#' @title Function to compute the result of the Gompertz
#' allometric model.
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
#' - Gompertz B. 1825. On the nature of the function expressive of
#' the law of human mortality, and on a new mode of determining the
#' value of life contingencies. Philosophical Transactions of the
#' Royal Society of London 115:513–583.
#' - Salas-Eljatib C, Mehtatalo L, Gregoire TG, Soto DP,
#' Vargas-Gaete R. 2021. Growth equations in forest research:
#' mathematical basis and model similarities. Current
#' Forestry Reports 7:230-244. \doi{10.1007/s40725-021-00145-8}
#' - Salas-Eljatib C. 2025. Funciones alométricas: reparametrizaciones
#' y características matemáticas. Documento de trabajo No. 1,
#' Serie: Cuadernos de biometría, Laboratorio de Biometría y
#' Modelación Forestal, Universidad de Chile. Santiago, Chile. 51 p.
#' \url{https://biometriaforestal.uchile.cl}
#' @examples
#' # Predictor variable values to be used
#' time<-seq(5,60,by=0.01)
#' # Using the function
#' y<-gompertz.fx(x=time,alpha=25,beta=.22,gamma=16)
#' plot(time,y,type="l")
#'  
#' @rdname gompertz.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
gompertz.fx <- function(x,alpha,beta, gamma, upsilon=0){
    upsilon + alpha*exp((-exp(-beta*(x-gamma))))
}
