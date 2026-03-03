#' Function of the Johnson-Schumacher model, based
#' upon two parameters and a single predictor variable as
#' follows
#' \deqn{y_i= \alpha \mathrm{e}^{\left(-\beta/ {x_i} \right)},
#' }
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively, for the *i*-th
#' observation; and the rest are parameters (i.e., coefficients).
#' Further details on this model can be found in
#' Salas-Eljatib et al (2021) and Salas-Eljatib (2025).
#'
#' @title A function having the mathematical expression of
#' the Johnson-Schumacher model.
#' @param x is the predictor variable.
#' @param a is the coefficient-parameter  \eqn{\alpha}.
#' @param b is the  coefficient-parameter  \eqn{\beta}.
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
#' - Johnson NO. 1935. A trend line for growth series.
#' J. Am. Stat. Assoc. 30(192):717-717.
#' - Schumacher FX. 1939. A new growth curve and its application to
#' timber yield studies. J. of Forestry 37(10):819-820.
#' - Salas-Eljatib C, Mehtatalo L, Gregoire TG, Soto DP,
#' Vargas-Gaete R. 2021. Growth equations in forest research:
#' mathematical basis and model similarities. Current Forestry
#' Reports 7:230-244. \doi{10.1007/s40725-021-00145-8}
#' - Salas-Eljatib C. 2025. Funciones alométricas: reparametrizaciones
#' y características matemáticas. Documento de trabajo No. 1,
#' Serie: Cuadernos de biometría, Laboratorio de Biometría y
#' Modelación Forestal, Universidad de Chile. Santiago, Chile. 51 p.
#' \url{https://biometriaforestal.uchile.cl}
#' @examples
#' # Predictor variable values to be used
#' d<-seq(5,60,by=0.01)
#' # Using the function
#' h<-schuma.fx(x=d,a=3.87,b=4.38)
#' plot(d,h,type="l")
#'  
#' @rdname schum.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
schuma.fx <- function(x=x, a=alpha, b=beta, phi=0){
    alpha<-a;beta<-b;    
    phi+ alpha*exp(-beta/x ) 
}
