#' Lista de árboles en un muestreo forestal
#'
#' @description
#' Variables a nivel de árbol medidas en tres unidades de muestreo (_i.e._,
#' parcelas) establecidas en un muestreo forestal. Este tipo de muestreo
#' de bosques, es comunmente conocido como ``inventario forestal''.
#'  Note que las parcelas podrían tener diferentes superficies. El muestreo
#'  fue realizado en un bosque secundario dominado por
#'   _Nothofagus obliqua_ en el predio Rucamanque, en
#'   las cercanías de la ciudad de Temuco, en el sur de Chile.
#' @usage
#' data(treelistinve2)
#' @format Contiene variables a nivel de árbol dentro de parcelas.
#' \describe{
#'   \item{parce}{Número de la parcela de muestreo.}
#'   \item{sup.parce}{Superficie de la parcela, en m\eqn{^{2}}{^2}.}
#'   \item{arbol}{Número identificador del árbol.}
#' \item{spp}{Nombre común de especies como sigue: Olivillo=_Aextocicon
#' puncatatum_, Tepa=_Laureliopsis philippiana_, Lingue=_Persea lingue_,
#' Coigue=_Nothofagus dombeyi_, Roble=_Nothofagus obliqua_, Other=Other}
#' \item{dap}{Diámetro a la altura del pecho, en cm.}
#' \item{atot}{Altura total, en m. Solo medida en algunos árboles muestra.}
#'  }
#' @source
#'  Los datos fueron cedidos por el Prof. Christian Salas-Eljatib,
#'   Universidad de Chile (Santiago, Chile).
#' @references
#' - Salas C. 2001. Caracterización básica del relicto de Biodiversidad
#' Rucamanque. Bosque Nativo, 29:3-9.
#' \url{https://eljatib.com/publication/2001-06-01_caracterizacion_basi/}
#'
#' - Salas C. 2002. Ajuste y validación de ecuaciones de volumen para un relicto
#' del bosque de Roble-Laurel-Lingue. Bosque 23(2): 81-92.
#'  \doi{10.4067/S0717-92002002000200009}
#'  \url{https://eljatib.com/publication/2002-07-01_ajuste_y_validacion_/}
#' @examples
#' data(treelistinve2)
#' unique(treelistinve2$parce)
#' table(treelistinve2$parce,treelistinve2$sup.parce)
#' tapply(treelistinve2$dap,treelistinve2$spp,summary)
'treelistinve2'
