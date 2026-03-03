#' Function of the Hossfeld (actually it is "Hoßfeld") allometric
#' model, based upon parameters (i.e., coefficients) and a variable,
#' as defined by the mathematical expression
#' \deqn{y_i= \alpha
#' \left(\frac{1}{1+\frac{\beta}{x_i^{\gamma}}}\right),
#' }
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively, for the *i*-th observation;  
#'  and the rest are parameters (i.e., coefficients).
#' Further details on this function can be found in
#' Salas-Eljatib (2025).
#'
#' @title Function that computes the result of the Hossfeld allometric
#' model.
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
#' - Hoßfeld JW. 1822. Mathematik für Forstmänner, Oekonomen und
#' Cameralisten. Dresden, Germany. Gotha:Hennings. 472 p.
#' - Salas-Eljatib C. 2025. Funciones alométricas: reparametrizaciones
#' y características matemáticas. Documento de trabajo No. 1,
#' Serie: Cuadernos de biometría, Laboratorio de Biometría y
#' Modelación Forestal, Universidad de Chile. Santiago, Chile. 51 p.
#' \url{https://biometriaforestal.uchile.cl}
#' @examples
#' # Predictor variable values to be used
#' time<-seq(5,60,by=0.01)
#' # Using the function
#' y<-hossfeld.fx(x=time,a=31,b=38,c=1.4)
#' plot(time,y,type="l")
#'  
#' @rdname hossfeld.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
hossfeld.fx <-  function(x, a=alpha, b=beta, c=gamma, phi=0){
    alpha<-a;beta<-b;gamma<-c    
    phi+ alpha* (1/(1+(beta/x^gamma)))
}
