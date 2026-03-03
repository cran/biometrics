#' Tabla de rodal para bosque de _Nothofagus dombeyi_ (coihue)
#'
#' @description
#' Tabla de rodal para un bosque secundario de _Nothofagus dombeyi_
#'  (coihue) en  Chile.
#' @usage
#' data(standtabCoihue2)
#' @format Los datos tienen las siguientes columnas
#' \describe{
#' \item{cd}{Marca de la clase diamétrica, en cm.}
#' \item{nha}{Densidad de la clase diamétrica, en arb/ha.}
#' \item{gha}{Área basal de la clase diamétrica,
#' en m\eqn{^{2}}{^2}/ha.}
#'  }
#' @source
#' Bosque ubicado en sector Andino de la Región de la Araucanía
#' en el sur de Chile. Cuadro cedido por el Prof. Christian
#' Salas-Eljatib, Universidad de Chile, Santiago, Chile.
#' @references
#' - Donoso C. 1995. Bosques Templados de Chile y Argentina.
#' Editorial Universitaria. Santiago, Chile.
#' @examples
#' data(standtabCoihue2)
#' df<-standtabCoihue2
#' df<-df[-nrow(df),]
#' # Diameter distribution plot 
#' barplot(df$nha, legend = TRUE, beside = TRUE, las=1,
#'         names.arg = as.numeric(df$cd),
#'         ylab="Densidad (arb/ha)",xlab="Clase diametrica (cm)")
#' abline(h=0)
"standtabCoihue2"
