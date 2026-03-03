#' Function of the Logistic modified model, based
#' upon three parameters and a single predictor variable as
#' follows
#' \deqn{y_i= \frac{\alpha}{1+\mathrm{e}^{-\left(x_i-\beta \right)/\gamma}},}
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively, for the *i*-th observation;  
#'  and the rest are parameters (i.e., coefficients).
#'
#' @title A function having the mathematical expression of
#' the Logistic modified model.
#' @param x is the predictor variable.
#' @param a is the coefficient-parameter  \eqn{\alpha}.
#' @param b is the  coefficient-parameter  \eqn{\beta}.
#' @param c is the  coefficient-parameter  \eqn{\gamma}.
#' @param phi is an optional constant term that force the prediction
#' of *y* when *x=0*. Thus, the new model becomes
#' \eqn{ y_i = \phi+ f\left(x_i,\mathbf{\theta}\right)}, where
#' \eqn{\mathbf{\theta}} is the vector of coefficients of
#' the above described function represented by
#' \eqn{f(\cdot)}. The default
#' value for \eqn{\phi} is 0.
#'
#' @return Returns the response variable based upon
#' the predictor variable and the coefficients. 
#' @author Christian Salas-Eljatib.
#' @references
#' - Pearl R. 1909. Some recent studies on growth. The American
#' Naturalist 43(509):302-316.
#' - Pinheiro JC, DM Bates. 2000. Mixed-effects Models in S and
#' Splus. New York, USA. Springer-Verlag. 528 p.
#' - Salas-Eljatib C. 2025. Funciones alométricas: reparametrizaciones
#' y características matemáticas. Documento de trabajo No. 1,
#' Serie: Cuadernos de biometría, Laboratorio de Biometría y
#' Modelación Forestal, Universidad de Chile. Santiago, Chile. 51 p.
#' \url{https://biometriaforestal.uchile.cl}
#' @examples
#' # Predictor variable values to be used
#' time<-seq(0.1,65,by=0.01)
#' # Using the function
#' y<-logistm.fx(x=time,a=22,b=8.59,c=4.72)
#' plot(time,y,type="l")
#' #'  
#' @rdname logistm.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
logistm.fx <-  function(x, a=alpha, b=beta, c=gamma, phi=0){
    alpha<-a;beta<-b;gamma<-c    
    phi+ alpha/(1+exp(-(x-beta)/gamma))  
}
