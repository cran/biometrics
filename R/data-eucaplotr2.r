#'  Lista de árboles con variables medidas (más realista) en una parcela de 
#' muestreo, establecida en una plantación de Eucalyptus globulus.  
#'
#' @description
#' Variables a nivel individual medidas en los árboles encontrados en una 
#' parcela de muestreo (de 500 m\eqn{^{2}}{^2}) en una plantación forestal 
#' de *Eucalyptus globulus*, cerca de Gorbea (Sur de Chile). La variable 
#' altura fue medida solo en una sub-muestra de árboles. La plantación 
#' tiene 15 años de edad y ha estado sujeta a tres raleos. Este set de datos
#' es similar al de la dataframe `eucaplot2`, pero siendo más realista en el 
#' sentido que no es comun que la altura se mida en todos los árboles como 
#' es el caso de los dataframe `eucaplot2`. 
#' @usage
#' data(eucaplotr2)
#' @format Los datos contienen las siguientes cuatro columnas:
#' \describe{
#'   \item{dap}{Diámetro a la altura del pecho, en cm.}
#'   \item{sanidad}{Evaluación cualitativa de la sanidad del árbol 
#'   (1: buena, 2: media, 3: mala).}
#'   \item{forma}{Evaluación cualtitativa de la forma del fuste
#'    (1: buena, 2: media, 3: mala).}
#'   \item{clase.copa}{Clase de copa (1: superior, 2: intermedio, 3: inferior).}
#'   \item{atot}{Altura total, en m. Esta variable fue medida solo en
#'    una submuestra de árboles, y los registros vacíos estan denotados por 
#'    `NA`.}
#'  }
#' @source 
#' Los datos fueron cedidos por el Prof. Christian Salas-Eljatib 
#' (Universidad de Chile, Santiago, Chile), y colectados
#' por él mientras fue Profesor del Departamento de Ciencias Forestales en 
#' la Universidad de La Frontera (Temuco, Chile).
#' La plantación se encontraba dentro de un predio del colega (QEPD) Hugo 
#' Castro.   
#' @references
#' - Forest biometrics lecture notes, Prof. Christian Salas-Eljatib,
#' Universidad de Chile. Santiago, Chile
#' @examples
#' data(eucaplotr2)    
#' table(eucaplotr2$sanidad)
#' library(datana) 
#' descstat(eucaplotr2[,c("dap","atot")])
"eucaplotr2"
