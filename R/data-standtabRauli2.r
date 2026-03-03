#' Tablas de rodal para bosques de _Nothofagus alpina_ (raulí)
#'
#' @description
#' Tablas de rodal para bosques secundarios dominados
#' por _Nothofagus alpina_ en diferentes localidades del sur de Chile.
#' @usage
#' data(standtabRauli2)
#' @format Los datos tienen las siguientes columnas
#' \describe{
#' \item{sitio}{Nombre del sitio de estudio.}
#' \item{sector}{Código identificador de un sector específico
#' dentro del sitio en estudio.}
#' \item{linf.cd}{Límite inferior de la clase diamétrica, en cm.}
#' \item{lsup.cd}{Límite superior de la clase diamétrica, en cm.}
#' \item{cd}{Marca de la clase diamétrica, en cm.}
#' \item{nha.cd}{Densidad de la clase diamétrica, en arb/ha.}
#' \item{bosque.id}{Identificador del bosque, combinación de
#' `sitio` y `sector`.}
#'  }
#' @source
#' Densidad de árboles por clase diamétrica, i.e., tabla de rodal.
#' Datos digitados desde el cuadro No. 4 de Wadsworth (1976).
#' @references
#' - Wadsworth RK. 1976. Aspectos ecologicos y crecimiento del
#'  raulí (_Nothofagus alpina_) y sus asociados en bosques de
#' segundo crecimiento
#' de las provincias de Bío-Bío, Malleco y Cautín, Chile.
#' Boletin Técnico No. 37, Fac. Cs. Forestales, Universidad de Chile,
#' Santiago, Chile.
#' @examples
#' data(standtabRauli2)
#' head(standtabRauli2)
#' df<-standtabRauli2
#' table(df$sitio,df$sector,df$cd)
"standtabRauli2"
