#' Tree-list data from a forest sampling work
#'
#' @description
#' Tree-level variables measured within three sample plots in a
#' forest sampling effort. This sort of work is commonly referred as
#' a forest inventory. Notice that plots might have different areas.
#' The sampling was carried out in a secondary forest of _Nothofagus obliqua_
#' in the Rucamanque experimental station, near the city of Temuco, in
#' southern Chile.
#' @usage
#' data(treelistinve)
#' @format Contains tree-level variables, as follows:
#' \describe{
#'   \item{plot}{Plot number.}
#'   \item{plot.size}{Plot size, in m\eqn{^{2}}{^2}.}
#'   \item{tree}{Tree identificator}
#' \item{species}{Species common name as follows: Olivillo=_Aextocicon
#' puncatatum_, Tepa=_Laureliopsis philippiana_, Lingue=_Persea lingue_,
#' Coigue=_Nothofagus dombeyi_, Roble=_Nothofagus obliqua_, Other=Other}
#' \item{dbh}{Diameter at breast-height, in cm.}
#' \item{toth}{Total height, in m. Only measured for some sample trees.}
#'  }
#' @source
#'  The data is provided courtesy of Prof. Christian Salas-Eljatib,
#'  Universidad de Chile (Santiago, Chile).
#' @references
#' - Salas C. 2001. Caracterización básica del relicto de Biodiversidad
#' Rucamanque. Bosque Nativo, 29:3-9.
#' \url{https://eljatib.com/publication/2001-06-01_caracterizacion_basi/}
#'
#' - Salas C. 2002. Ajuste y validación de ecuaciones de volumen para un
#' relicto del bosque de Roble-Laurel-Lingue. Bosque 23(2): 81-92.
#' \doi{10.4067/S0717-92002002000200009}
#' \url{https://eljatib.com/publication/2002-07-01_ajuste_y_validacion_/}
#' @examples
#' data(treelistinve)
#' head(treelistinve)
#' tapply(treelistinve$dbh,treelistinve$species,summary)
'treelistinve'
