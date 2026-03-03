#' Polynomial function of Carrasco (1986)
#'
#' This function takes the form of
#'
#' \deqn{\frac{d_{l_{i}}}{d_i} = \beta_0 + \beta_1 X + \beta_2 X^2 +
#'  \beta_3 X^3 + \cdots + \beta_n X^{n},
#' }
#' where: \eqn{d_{l_{i}}} is the stem diameter at stem-height
#' \eqn{h_{l_{i}}} for the *i*-th tree; \eqn{d_i} and \eqn{h_i} are
#' the tree-level variables diameter at breast height and total height
#' respectively for the *i*-th tree, and $n$ is the degree of the
#' polynomial. The other term is
#'
#' \deqn{X = \frac{hcc_i - h_{l_i}}{hcc_i - 1.3},
#' }
#' @title Carrasco polynomial function
#' @param hl is stem height within the tree, thus \eqn{h_l \leq h}.
#' @param hcc is height to crown base.
#' @param n degree of the polynomic function
#' @param paramod is a vector having the coefficients
#' of the taper model in the following order up to `n`:
#' \eqn{\beta_0, \beta_1, \beta_2, ... , \beta_n}
#' @return Returns the diameter of the stem at the
#' stem-height \eqn{h_l}, thus \eqn{d_l}, divided by the diameter at
#' breast height (1.3). This is
#' \deqn{
#' \frac{d_{l_i}}{d_i}
#' }
#' @author Christian Salas-Eljatib and Nicolás Campos
#' @references
#' - Carrasco, J. 1986. Estudio Comparativo de dos Métodos para
#' Evaluar la Calidad a árboles en pie y para representar la Forma
#' del Fuste en el Bosque Siempreverde valdiviano. Tesis Ingeniero
#' Forestal. Universidad Austral de Chile. Valdivia, Chile. 117 p.
#' @examples
#' dl <- seq(40, 0, -5)
#' hl <- seq(0, 16, 2)
#' d <- 30
#' hcc <- 12
#' h <- max(hl)
#' df <- data.frame(dl = dl,
#'                  hl = hl,
#'                  d = d,
#'                  hcc = hcc,
#'                  h = h)
#' df
#' 
#' myparams <- c(0.3, 0.8, 0.00003)
#' 
#' taperpoly.fx(hl = df$hl, hcc = df$hcc, paramod = myparams, n = 2)
#' 
#' df$y <- taperpoly.fx(hl = df$hl, hcc = df$hcc, paramod = myparams, n = 2)
#' ## the n parameter is not necesary
#' df$y2 <- taperpoly.fx(hl = df$hl, hcc = df$hcc, paramod = myparams)
#' df$dl.h <- df$y * df$d
#' df
#' 
#' @rdname taperpoly.fx
#' @export
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
taperpoly.fx <- function(hl = hl, hcc = hcc,
                         paramod = paramod,
                         n = (length(paramod) - 1)) {
    if (n != (length(paramod) - 1)) {
        stop("n must be the equal to the number of parameters minus one")
    }
    x <- (hcc - hl) / (hcc - 1.3)
    final.value <- 0
    for (i in seq_along(paramod)) {
        final.value <- final.value + paramod[i] * (x ^ (i - 1))
    }
    return(final.value)
}
