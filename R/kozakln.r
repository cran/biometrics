#' Function of the natural log-transformed Kozak (1988) taper
#' equation model, based upon the model parameters, and the
#' tree variables: diameter, total height, and stem height.
#' The mathematical expression is as follows
#' \deqn{
#'  \ln{d_{l_{i}}}=\alpha_0 + \alpha_1 \ln{d_i}+\alpha_2 {d_i}+
#' \beta_1  \ln{(X_{l_{i}})} z_{l_{i}}^{2} +
#' \beta_2  \ln{(X_{l_{i}})}  \ln{(z_{l_{i}}+0.001)} +
#' \beta_3  \ln{(X_{l_{i}})} \sqrt{z_{l_{i}}}  +\\
#' \beta_4 \ln{(X_{l_{i}})}  e^{z_{l_{i}}} +
#' \beta_5  \ln{(X_{l_{i}})} \frac{d_i}{h_i},}
#' where: \eqn{d_{l_{i}}} is the stem diameter at stem-height
#' \eqn{h_{l_{i}}} for the *i*-th tree; and 
#' \eqn{d_i} and \eqn{h_i} are the tree-level variables
#' diameter at breast height and total height, respectively, for
#' tje *i*-th tree.  The other terms are 
#' \deqn{z_{l_{i}}=\frac{h_{l_{i}}}{h_i},}
#' \deqn{X_{l_{i}}=\frac{ 1-\sqrt{ z_{l_{i}}} }{ 1-\sqrt{p} },}
#' with *p* being the inflextion point.
#'
#' @title Function to computes the stem diameter of a tree according
#' to the log-transformed Kozak (1988) taper equation.
#' @param d is the diameter at breast height (1.3 m) of the tree.
#' The measurement unit is cm in the metric system, but ultimately
#' it will depend on how the model was previously fitted, because
#' of the measurement unit of the variables included.
#' @param h is total height of the tree.
#' @param hl is stem height within the tree,
#' thus \eqn{h_l \leq h}.
#' @param paramod is a vector having the eight coefficients
#' of the taper model in the following order:
#' \eqn{\alpha_0,\alpha_1,\alpha_2,\beta_1,\beta_2,\beta_3,\beta_4},
#' and \eqn{\beta_5}.
#' @param p is the inflextion height. By default is set
#' to 0.2
#' @param c0 is a constant build-in the model. By default is set
#' to 0.001.
#'
#' @return Returns the diameter of the stem at the
#' stem-height \eqn{h_l}, thus \eqn{d_l}, for the natural
#' log-transformed Kozak (1988) functional form, based upon tree
#' diameter  \eqn{d} and total height  \eqn{h}. Therefore, the
#' result applies the back-transformation by using the anti-log
#' function, i.e., `exp()`.
#' @author Christian Salas-Eljatib.
#' @references Kozak A. 1988. A variable-exponent taper equation. 
#'  Canadian Journal of Forest Research 18: 1363-1368.
#' \doi{10.1139/x88-213}
#' @examples
#' # Parameters
#' a0<- 0.04338410; a1<- 0.88657485; a2<- 0.00446052;b1<- 1.978196;
#' b2<- -0.40676847; b3<- 3.50815520; b4<- -1.84177070;b5<- 0.19647175
#' coefs<-c(a0,a1,a2,b1,b2,b3,b4,b5);p.coef <- 0.25
#' # Tree attributes
#' dbh <- 40; toth <- 25
#' 
#' # Using the function
#' hl.int <- c(0.3, 1.3, 5)
#' dl.hat <- kozakln.fx(d=dbh,h=toth,hl=hl.int,paramod=coefs,p=p.coef)
#' cbind(hl.int,dl.hat)
#' 
#' @rdname kozakln.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
kozakln.fx <- function(d, h, hl, paramod, p=0.2, c0=0.001) {
  alpha.0 <- paramod[1];  alpha.1 <- paramod[2]
  alpha.2 <- paramod[3];  beta.1 <- paramod[4]
  beta.2 <- paramod[5];  beta.3 <- paramod[6]
  beta.4 <- paramod[7];  beta.5 <- paramod[8]  

  Z <- hl/h; X <- (1 - sqrt(Z)) / (1 - sqrt(p)) 

  c1 <- alpha.0+ alpha.1 *log(d)+alpha.2*d
  c2 <- (beta.1 * log(X)* Z^2)
  c3 <- (beta.2 * log(X)* log(Z+c0)); 
  c4 <- (beta.3 * log(X) * sqrt(Z))
  c5 <- (beta.4 * log(X) * exp(Z));   
  c6 <- (beta.5 * log(X)*(d/h))
 
  out<-exp(c1+c2+c3+c4+c5+c6)
  out[h < hl] <- 0  
  ##dado que en el ajuste la definicion de X no esta definida
  ## para hl=h, dado que ahi X=0, y el ln(0) no esta definido
  ##matematicamente, para la prediccion a esa altura, simplemente
  ## lo asigno cero
  out[is.nan(out)] <- 0   
  out 
}
