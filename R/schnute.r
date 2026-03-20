#' Function of the  Schnute allometric
#' model, based upon parameters (i.e., coefficients) and a variable,
#' as defined by the mathematical expression
#' \deqn{y_i=\left\{\Upsilon^{\alpha}+(\gamma^{\alpha}-\Upsilon^{\alpha})
#'  \frac{1-\mathrm{e}^{-\beta(x_i)}}{1-\mathrm{e}^{-\beta(x_2)}}
#' \right \}^{1/\alpha},}
#' where: \eqn{y_i} and \eqn{x_i} are the response
#' and predictor variable, respectively, for the *i*-th observation;
#'  and the rest are parameters (i.e., coefficients).
#' Further details on this function can be found in
#' Salas-Eljatib et al (2021).
#'
#' @title Function that computes the result of the Schnute 
#' allometric model.
#' @param x is the predictor variable.
#' @param alpha is the coefficient-parameter  \eqn{\alpha}.
#' @param beta is the  coefficient-parameter  \eqn{\beta}.
#' @param gamma is the  coefficient-parameter  \eqn{\gamma}.
#' @param upsilon is an optional constant term that force the prediction
#' of *y* when *x=0*. The default value for \eqn{\Upsilon} is 0.
#' @param x1 is the minimum value for the x variable. The default
#' value is internally computed from the sample.
#' @param x2 is the maximumvalue for the x variable. The default
#' value is internally computed from the sample.
#'
#' @return Returns the response variable based upon
#' the predictor variable and the coefficients. 
#' @author Christian Salas-Eljatib.
#' @references
#' - Schnute I. 1981. A versatile growth model with statistically
#' stable parameters. Can. J. Fish. Aquat. Sci. 38(9):1128-1140.
#' - Salas-Eljatib C. 2025. Funciones alométricas: reparametrizaciones
#' y características matemáticas. Documento de trabajo No. 1,
#' Serie: Cuadernos de biometría, Laboratorio de Biometría y
#' Modelación Forestal, Universidad de Chile. Santiago, Chile. 51 p.
#' \url{https://biometriaforestal.uchile.cl}
#' @examples
#' # Predictor variable values to be used
#' d<-seq(5,60,by=0.01)
#' # Using the function
#' h<-schnute.fx(x=d,alpha=1.77,beta=0.01,gamma=28)
#' plot(d,h,type="l")
#'  
#' @rdname schnute.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
schnute.fx <- function(x, alpha, beta, gamma, upsilon=0,
                       x1=min(x),x2=max(x))
{
    (
        (upsilon^alpha) + ((gamma^alpha) - (upsilon^alpha)) *
        ((1-exp(-beta*(x-x1)))/(1-exp(-beta*(x2-x1))))
    )^(1/alpha)
}
