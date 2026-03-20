#' Function of the asymptotic regression model, based
#' upon its parameters and a variable, as
#' follows
#' \deqn{y_i= \alpha +
#' \left(\beta-\alpha\right) \left\{\mathrm{e}^{
#' \left[-\left(\mathrm{e}^{-\gamma}\right) x_i \right]
#' }\right\},
#' }
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively, for the *i*-th observation;  
#'  and the rest are parameters (i.e., coefficients).
#'
#' @title Function to compute the result of the asymptotic
#' regression model, as an allometric functional form.
#' @param x is the predictor variable.
#' @param alpha is the coefficient-parameter  \eqn{\alpha}.
#' @param beta is the  coefficient-parameter  \eqn{\beta}.
#' @param upsilon is an optional constant term that force the prediction
#' of *y* when *x=0*. Thus, the new model becomes
#' \eqn{ y_i = \alpha + \left(\Upsilon-\alpha\right) \left\{\mathrm{e}^{
#' \left[-\left(\mathrm{e}^{-\beta}\right) x_i \right]
#' }\right\} }, thus the model will have only two parameters.
#' By default \eqn{\Upsilon} is set to `0`.
#'
#' @return Returns the response variable based upon
#' the predictor variable and the coefficients. 
#' @author Christian Salas-Eljatib.
#' @references
#' - Pinheiro JC, DM Bates. 2000. Mixed-effects Models in S and
#' Splus. New York, USA. Springer-Verlag. 528 p.
#' - Salas-Eljatib C. 2025. Funciones alométricas: reparametrizaciones
#' y características matemáticas. Documento de trabajo No. 1,
#' Serie: Cuadernos de biometría, Laboratorio de Biometría y
#' Modelación Forestal, Universidad de Chile. Santiago, Chile. 51 p.
#' \url{https://biometriaforestal.uchile.cl}
#' @examples
#' #---------------------
#' # 2-parameters variant
#' # Predictor variable values to be used
#' time<-seq(0,50,by=0.1)
#' # Using the function, upsilon must be provided
#' y<-asymreg.fx(x=time,alpha=20,beta=2.5,upsilon =5)
#' plot(time,y,type="l",ylim=c(0,20))
#'  
#' @rdname asymreg.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
asymreg.fx <- function(x, alpha, beta, upsilon=0){
    ## if(is.na(c)==FALSE){gamma<-c} ##version con offset
    ## if(is.na(c)==FALSE){y=alpha +(beta-alpha)*(exp(-exp(-gamma)*x))}   
    ##modelo forzado para cuando x(0)-->y=phi
    alpha +(upsilon-alpha)*(exp(-exp(-beta)*x))    
##when upsilon, which is y(0), is defined, then the model has only
## two parameters
}
