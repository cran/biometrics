#' Datos a nivel de árbol de parcelas de muestreo en plantaciones de Pinus radiata
#' @description
#' Es un listado de árboles con características de árboles medidos
#' dentro de unidades de muestreo en una plantación de 13
#' años de edad de _Pinus radiata_ ubicada cerca
#' a Capitán Pastene, región de la Araucanía, Chile. Las
#' parcelas de muestreo tienen 150 m², y la plantación cubre una
#' superficie total de 45 ha.
#' @usage
#' data(radiatapl2)
#' @format Los datos contienen las siguientes columnas
#' \describe{
#'   \item{parce}{Número de identificación de la parcela de muestreo.}
#'   \item{arbol}{Número de identificación del árbol dentro de la parcela.}
#'   \item{dap}{Diámetro a la altura del pecho (1.3 m), en cm.}
#'   \item{atot}{Altura total, en m. Solo registrada para algunos árboles muestra.}
#'   \item{sanidad}{Clasificación sobre el estado sanitario del árbol, en tres niveles: buena, media, y mala.}
#'  }
#' @source
#' Los datos son cortesía del Ing. Forestal Mauricio Lobos-Beneventi (Temuco, Chile), y fueron recolectados en conjunto con su colega Christian Salas-Eljatib.
#' @examples
#' data(radiatapl2)
#' head(radiatapl2)
'radiatapl2'
