#' Tree-level volume by species in the Rucamanque forest
#'
#' @description
#' These is tree-level measurement data of sample trees in the
#' Rucamanque experimental forest, near Temuco, in the Araucanía
#' region in south-central Chile. Data were measured in 1999. 
#' @usage
#' data(treevolruca)
#' @format Contains tree-level variables, as follows:
#' \describe{
#'   \item{tree}{Tree number identification.}
#'   \item{spp}{Tree species common name as follows: 
#' "Laurel" is *Laurelia sempervirens*, 
#' "Lingue" is *Persea lingue*,
#'  "Olivillo" is *Aextoxicon punctatum*, 
#' "Tepa" is *Laureliopsis philippiana*, 
#' "Tineo" is *Weinmannia trichosperma*, y 
#' "Ulmo" is *Eucryphia cordifolia*.}
#' \item{dbh}{Diameter at breast height, in cm.}
#' \item{toth}{Total height, in m.}
#'  \item{d6}{Upper-stem diameter at 6 m, in cm.}
#' \item{totv}{Tree gross volume, in m³ with bark.}
#'  }
#' @source
#' The data were provided courtesy of Dr. Christian Salas-Eljatib,
#'  Universidad de Chile (Santiago, Chile).
#' @references
#' - Salas C. 2002. Ajuste y validación de ecuaciones de volumen para
#' un relicto del bosque de Roble-Laurel-Lingue. Bosque 23(2): 81-92.
#' \doi{10.4067/S0717-92002002000200009}
#' \url{https://eljatib.com/publication/2002-07-01_ajuste_y_validacion_/}
#' @examples
#' data(treevolruca)
#' head(treevolruca)
#' table(treevolruca$spp)
'treevolruca'
