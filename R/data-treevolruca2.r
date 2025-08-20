#' Volumen a nivel de árbol para especies nativas del bosque de Rucamanque
#'
#' @description
#' Volumen, altura y diámetro, entre otras para árboles muestra
#' en el bosque de Rucamanque, cerca de Temuco,
#' en la región de la Araucanía, en el sur de Chile.
#' @usage
#' data(treevolruca2)
#' @format Las siguientes columnas son parte de la dataframe:
#' \describe{
#'   \item{arbol}{Número del árbol.}
#'   \item{spp}{Codificación de la especie como sigue: 
#' "Laurel" es *Laurelia sempervirens*, 
#' "Lingue" es *Persea lingue*,
#'  "Olivillo" es *Aextoxicon punctatum*, 
#' "Tepa" es *Laureliopsis philippiana*, 
#' "Tineo" es *Weinmannia trichosperma*, y 
#' "Ulmo" es *Eucryphia cordifolia*.}
#' \item{dap}{Diámetro a la altura del pecho, en cm.}
#' \item{atot}{Altura total, en m.}
#'  \item{d6}{Diámetro fustal a los 6 m, en cm.}
#' \item{vtot}{Volumen bruto total, en m³ con corteza.}
#'  }
#' @source
#' Los datos fueron cedidos por el Dr. Christian Salas-Eljatib,
#' Universidad de Chile (Santago, Chile).
#' @references
#' - Salas C. 2002. Ajuste y validación de ecuaciones de volumen
#' para un relicto del bosque de Roble-Laurel-Lingue.
#' Bosque 23(2): 81-92. \doi{10.4067/S0717-92002002000200009}
#'  \url{https://eljatib.com/publication/2002-07-01_ajuste_y_validacion_/}
#' @examples
#' data(treevolruca2)
#' head(treevolruca2)
#' table(treevolruca2$spp)
'treevolruca2'
