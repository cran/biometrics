#' Datos de ahusamiento de Eucalyptus regnans
#'
#' @description
#' Corresponde a mediciones de diámetros fustales, con y sin corteza,
#' para árboles muestra en plantaciones de _Eucalyptus regnans_ en la
#' comuna de Gorbea, región de la Araucanía, Chile. Note que existen
#' por lo tanto, varias mediciones para cada árbol.
#'
#' @usage
#' data(tapereuca2)
#'
#' @format Contiene las siguientes variables:
#' \describe{
#'   \item{narb}{Número del árbol.}
#'   \item{sec}{Número de sección del árbol `narb`.}
#'   \item{hl}{Altura fustal de la sección `sec`, en m.}
#'   \item{dlcc}{Diámetro de la sección `sec` con corteza, en cm.}
#'   \item{dlsc}{Diámetro de la sección `sec` sin corteza, en cm.}
#'   \item{ec}{Espesor de corteza de la sección `sec`.}
#'   \item{forma}{Forma del árbol, en donde `1` = Fuste cilíndrico y `2`
#'   = Fuste acilíndrico (pequeña curvatura).}
#'   \item{dap}{Diámetro a la altura del pecho (1.3 m) en cm.}
#'   \item{decdap}{Doble espesor de corteza en el `dap`.}
#'   \item{htot}{Altura total del árbol `narb`, en m.}
#'   \item{dtoc}{Diámetro con corteza en `hcc`.}
#'   \item{hcc}{Altura de comienzo de copa del árbol `narb`, m.}
#' }
#'
#' @source
#' Los datos provienen de la Tesis de Ingeniero Forestal de Manuel
#' Morales, UFRO.
#'
#' @references
#' - Morales, M. (2003). Modelos fustales para _Eucalyptus
#' regnans_ F. Muell., en la comuna de Gorbea, Novena Región. Tesis
#' Ingeniero Forestal. Universidad de La Frontera. Temuco, Chile. 43p.
#'
#' @examples
#' data(tapereuca2)
#' lattice::xyplot(dlcc~hl, data=tapereuca2, type = "l", groups = narb)
'tapereuca2'
