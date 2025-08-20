#' Población de 400 elementos de la variable volumen de bosque
#'
#' @description
#' Los datos corresponden a una lista de 400 elementos de un población de la
#' variable volumen de bosque (en m\eqn{^{3}}{^3}/ha), medida en parcelas
#' de 0.1 ha de superficie. Por lo tanto, los datos provienen de
#' una grilla de 20 filas por 20 columnas, que cubren por completo un
#' bosque de 40 ha de superficie.
#' @usage
#' data(popvol2)
#' @format Contiene las siguientes dos columnas:
#' \describe{
#'   \item{plot.id}{Número de parcela (_i.e._, elemento de la población).}
#' \item{vol}{Volumen en m\eqn{^{3}}{^3}/ha}
#'  }
#' @source
#' Datos digitados desde el cuadro No. 11 de Zohrer (1980), el cual es en
#' realidad un cuadro citado del libro de Loetsch y Haller (1964).
#' @references
#' - Zohrer F. 1980. Forstinventur. Ein Leitfaden fur Studium und
#' Praxis. Pareys Studientexte Nr. 26. Parey. Berlin, Germany. 207
#'
#' - Loetsch F, Haller KE. 1964. Forest inventory.  Volume 1. 
#' Bayerischer Landwirtschaftsverlag Gmbh. Munchen, Germany. 436 p.
#'
#' @examples
#' data(popvol2)
#' sum(popvol2$vol)
#' mean(popvol2$vol)
#' hist(popvol2$vol)
'popvol2'
