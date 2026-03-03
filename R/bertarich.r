#' Function of the Bertalanffy-Richards model, based
#' upon three parameters and a single predictor variable as
#' follows
#' \deqn{y_i=  \alpha
#' \left(1-\mathrm{e}^{-\beta {x_i}}\right)^{1/\gamma},
#' }
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively for the *i*-th observation;
#' and the rest are parameters (i.e., coefficients).
#'
#' @title A function having the mathematical expression of
#' the Bertalanffy-Richards model.
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
#' - Richards FJ. 1959. A flexible growth function for empirical
#' use. J. of Experimental Botany 10(29):290-300.
#' - von Bertalanffy L. 1957. Quantitative laws in metabolism and
#' growth. The Quarterly Review of Biology 32(3):217-231.
#' - Salas-Eljatib C. 2020. Height growth-rate at a given height: a
#' mathematical perspective for forest productivity.
#' Ecological Modelling 431:109198. \doi{10.1016/j.ecolmodel.2020.109198}
#' \url{https://eljatib.com/myPubs/2020hgrate_ecoModelling.pdf}
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
#' y<-bertarich.fx(x=time,a=23,b=0.08,c=0.89)
#' plot(time,y,type="l")
#'  
#' @rdname bertarich.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
bertarich.fx <- function(x, a=alpha, b=beta, c=gamma, phi=0){
    alpha<-a;beta<-b;gamma<-c    
    phi+ alpha*(1-exp(-beta*x))^(1/gamma) 
}
