#' Contiene mediciones de material leñoso muerto en una
#' unidad de muestreo de linea.
#'
#' @description
#' Son variables medidas a nivel de trozo en la unidad de muestreo
#' (LIS).  El largo de la línea de muestreo o transecto es de
#' 30 m.  Detalles sobre este tipo de estrategia de muestreo 
#' se pueden revisar en  Gregoire and Valentine (2008).
#'
#' @format Data contiene las siguientes columnas:
#' \describe{
#'   \item{elemento}{Número del elemento (i.e., trozo) medido dentro
#' de la muesta de LIS.}
#'   \item{diam}{Diámetro en la mitad del elemento, en cm.}
#'   \item{lar}{Largo, en m.}
#'   \item{ang}{Ángulo de intersección del elemento con la línea de
#' muestreo LIS, en grados.}
#'  }
#' @source
#' Datos digitados desde Marshall et al (2000).
#'
#' @references
#' - Marshall PL, G Davis, VM LeMay. 2000. Using line intersect
#' sampling for coarse woody debris. Technical Report 3,
#' British Columbia Forest Service, Nanaimo, BC, Canada. 34 p.
#' - Gregoire TG, HT Valentine. 2008. Sampling Strategies for Natural
#' Resources and the Environment. New York, USA.
#' Chapman & Hall/CRC. 474 p.
#'
#' @examples
#' data(cwd2)
#' cwd2
'cwd2'
