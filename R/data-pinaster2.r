#' Volumen individual de árboles de Pinus pinaster en Galicia, España
#'
#' @description
#' Variables de volumen y otras a nivel de árbol para una muestra de árboles
#'  de Pinus pinaster en la comarca del Baixo-Mino en Galicia, España.
#' @usage
#' data(pinaster2)
#' @format Contiene las siguientes variables a nivel de árbol:
#' \describe{
#'   \item{rodal}{Rodal desde donde el árbol fue muestreado}
#' \item{ind.sitio}{Índice de sitio del rodal, en m.}
#' \item{arbol}{Número del árbol.}
#' \item{dap}{Diámetro a la altura del pecho, en cm.}
#' \item{atot}{Altura total, en m.}
#'  \item{d4}{Diámetro fustal a los 4 m, en cm.}
#' \item{vtcc}{Volumen bruto total con corteza, en m\eqn{^{3}}{^3}.}
#' \item{vtsc}{Volumen bruto total sin corteza, en m\eqn{^{3}}{^3}.}
#'  }
#' @source
#' Lo datos fueron cedidos cortesía del Dr. Christian Salas-Eljatib de
#' la Universidad de Chile (Santiago, Chile).
#' @references
#'  - Salas C, Nieto L, Irisarri A. 2005. Modelos de volumen para
#'  Pinus pinaster Ait. en la comarca del Baixo Miño,
#'   Galicia, España. Quebracho 12: 11-22.
#'    \url{https://eljatib.com/publication/2005-12-01_modelos_de_volumen_p/}
#' @examples
#' data(pinaster2)
#' head(pinaster2)
'pinaster2'
