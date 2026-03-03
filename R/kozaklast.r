#' Function of the Kozak (2004) taper equation model, based
#' upon the model parameters, and the tree variables: diameter,
#' total height, and stem height. The mathematical expression
#' is as follows (escribir la correcta)
#' \deqn{
#'    d_{l_{i}} =
#'     \alpha_0d_i^{\alpha_1}\alpha_2^{d_i}X_{l_{i}}^{
#' \left[\beta_1z_{l_{i}}^{2}+\beta_2\ln{(z_{l_{i}} + 0,001)}
#' + \beta_3\sqrt{z_{l_{i}}}+
#' \beta_4 e^{z_{l_{i}}}+\beta_5(d_i/h_i)\right] 
#' },}
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
#' to the Kozak (2004) taper equation.
#' @param d is the diameter at breast height (1.3 m) of the tree.
#' The measurement unit is cm in the metric system, but ultimately
#' it will depend on how the model was previously fitted, because
#' of the measurement unit of the variables included.
#' @param h is total height of the tree.
#' @param hl is stem height within the tree,
#' thus \eqn{h_l \leq h}.
#' @param paramod is a vector having the nine coefficients
#' of the taper model in the following order:
#' \eqn{\alpha_0,\alpha_1,\alpha_2,\beta_1,\beta_2,\beta_3,\beta_4,\beta_5},
#' and \eqn{\beta_6}.
#'
#' @return Returns the diameter of the stem at the
#' stem-height \eqn{h_l}, thus \eqn{d_l}, for the Kozak (1988)
#' functional form, based upon tree diameter  \eqn{d} and
#' total height  \eqn{h}. 
#' @author Christian Salas-Eljatib.
#' @references Kozak A. 2004. My last words on taper
#' equations. The Forestry Chronicle 80: 507–515.
#' \doi{10.1139/x88-213}
#' @examples
#' # Parameters
#' a0<- 0.80; a1<- 0.88809; a2<- 0.2
#' b1<- 0.95086; b2<- -0.18090; b3<- 0.61407;
#' b4<- -0.35105; b5 <- 0.05686; b6 <- 0.001;
#' coefs<-c(a0,a1,a2,b1,b2,b3,b4,b5,b6);
#' # Tree attributes
#' dbh <- 45; toth <- 27
#' 
#' # Using the function
#' hl.int <- c(0.3, 1.3, 5)
#' dl.hat <- kozaklast.fx(d=dbh,h=toth,hl=hl.int,paramod=coefs)
#' cbind(hl.int,dl.hat)
#'  
#' @rdname kozaklast.fx
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
kozaklast.fx <- function(d, h, hl, paramod) {
  alpha.0 <- paramod[1];  alpha.1 <- paramod[2]
  alpha.2 <- paramod[3];  beta.1 <- paramod[4]
  beta.2 <- paramod[5];  beta.3 <- paramod[6]
  beta.4 <- paramod[7];  beta.5 <- paramod[8]; beta.6 <- paramod[9]  

  dib <- alpha.0 * d^alpha.1 * h^alpha.2
  p<-1.3/h; Z <- hl/h; q<- 1.0 - Z^(1/3); 
  X <- (1.0 - Z^(1/3) ) / (1.0 - p^(1/3) ) 
  c1 <- beta.1*(Z^4);
  c2 <- beta.2 * (1/exp(d/h));
  c3 <- beta.3 * X^(0.1)
  c4 <- beta.4 * (1/d);
  c5 <- beta.5 * (h^q);
  c6 <- beta.6 * (X);
  out<-(dib*X^(c1+c2+c3+c4+c5+c6))
  out[h < hl] <- 0
  out 
}
