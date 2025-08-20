#' Function of the power model, based
#' upon the model parameters, and a single predictor variable as
#' follows
#' \deqn{ y_i = \alpha x_i^{\beta} }
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively for the *i*-th observation;  
#'  and the rest are parameters (i.e., coefficients).
#'
#' @title Function to computes the power model, as a
#' classical allometric functional form.
#' @param x is the predictor variable.
#' @param paramod is a vector having the  coefficients
#' of the model in the following order:
#' \eqn{\alpha,\beta}.
#' @param phi is an optional constant term that force the prediction
#' of *y* when *x=0*. Thus, the model becomes
#' \eqn{ y_i = \phi+ \alpha x_i^{\beta} }. The default
#' value is 0.
#'
#' @return Returns the response variable based upon
#' the predictor variable and the coefficients. 
#' @author Christian Salas-Eljatib.
#' @references Salas-Eljatib C. 2025. Funciones matematicas y
#' sus reparametrizaciones para la alometria de arboles. Documento
#' de trabajo No. 1, Serie: Cuadernos de biometria,
#' Laboratorio de Biometria y Modelacion Forestal, Universidad
#' de Chile. Santiago, Chile. 52 p.
#' @examples
#' # Parameters
#' alpha<- 2.86; beta<- 0.49;
#' coefs<-c(alpha,beta);
#' # Predictor variable to be used is 30 
#' # Using the function
#' powerfx(x=30,paramod=coefs)
#'  
#' @rdname powerfx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
powerfx <- function(x=x, paramod=paramod, phi=0){
    alpha<-paramod[1];beta<-paramod[2];
    phi + alpha*(x^beta)
}
