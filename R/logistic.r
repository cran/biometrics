#' Function of the Logistic model, based
#' upon three parameters and a single predictor variable as
#' follows
#' \deqn{y_i= \frac{\alpha}{1+  \mathrm{e}^{\beta - \gamma x_i}},}
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively, for the *i*-th observation;  
#'  and the rest are parameters (i.e., coefficients).
#'
#' @title A function having the mathematical expression of
#' the Logistic model.
#' @param x is the predictor variable.
#' @param alpha is the coefficient-parameter  \eqn{\alpha}.
#' @param beta is the  coefficient-parameter  \eqn{\beta}.
#' @param gamma is the  coefficient-parameter  \eqn{\gamma}.
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
#' - Pearl R. 1909. Some recent studies on growth. The American
#' Naturalist 43(509):302-316.
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
#' y<-logist.fx(x=time,alpha=22,beta=1.4,gamma=.1)
#' plot(time,y,type="l")
#' #'  
#' @rdname logist.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
logist.fx <-  function(x,alpha,beta,gamma, upsilon=0){
    upsilon+ alpha/(1+(exp(beta-(gamma*x)))) 
}
