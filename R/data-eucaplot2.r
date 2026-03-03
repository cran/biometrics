#'  Lista de árboles con todas las variables medidas en una parcela 
#' de muestreo, establecida en una plantación de *Eucalyptus globulus*.
#'
#' @description
#' Variables a nivel individual medidas en todos los árboles 
#' (incluso la variable altura) encontrados en una parcela de 
#' muestreo en una plantación forestal de *Eucalyptus globulus* cerca de 
#' Gorbea, en el sur de Chile. La superficie de la parcela es 
#' de 500 m\eqn{^{2}}. La plantación tiene 15 años de edad y 
#' ha estado sujeta a tres raleos.
#' @usage
#' data(eucaplot2)
#' @format Los datos contienen las siguientes cuatro columnas:
#' \describe{
#'   \item{dap}{Diámetro a la altura del pecho, en cm.}
#'   \item{sanidad}{Evaluación cualitativa de la sanidad 
#'   del árbol (1: buena, 2: media, 3: mala).}
#'   \item{forma}{Evaluación cualtitativa de la forma del 
#'   fuste (1: buena, 2: media, 3: mala).}
#'   \item{clase.copa}{Clase de copa (1: superior, 2: intermedio, 3: inferior).}
#'   \item{atot}{Altura total, en m.}
#'  }
#' @source 
#' Los datos fueron cedidos por el Prof. Christian Salas 
#' (Universidad de Chile, Santiago, Chile), y colectados
#' por él mientras fue Profesor del Departamento de Ciencias Forestales en 
#' la Universidad de La Frontera (Temuco, Chile). La plantación se encontraba 
#' dentro de un predio del colega (QEPD) Hugo Castro.  
#' @references
#' - Apuntes de Biometría y Modelación Forestal, Prof. Christian Salas-Eljatib,
#' Universidad de Chile. Santiago, Chile
#' @examples
#' data(eucaplot2)    
#' table(eucaplot$forma)
#' library(datana) 
#' descstat(eucaplot2[,c("dap","atot")])
"eucaplot2"
