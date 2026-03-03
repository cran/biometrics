#' Sampling plots data from a Pinus radiata plantation near Capitán
#' Pastene, La Araucanía region, Chile.
#' @description
#' Tree-level information collected within sample plots in a forestry
#' 13 years-old plantation of _Pinus radiata_ near Capitán Pastene,
#' Southern Chile. The sample plots size is 150 m², and the total area
#' of the plantation is 45 ha.
#' @usage
#' data(radiatapl)
#' @format The data frame contains four variables as follows:
#' \describe{
#'   \item{plot}{Plot number identification.}
#'   \item{tree}{Tree number identification.}
#'   \item{dbh}{Diameter at breast height (1.3 m), in cm.}
#'   \item{heigth}{Total height, in m. Not measured for all trees.}
#'   \item{sanity}{Tree-health clasification, assigned to any of the following levels: good, medium, and bad.}
#'  }
#' @source
#' The data are provided courtesy of Mr. Mauricio Lobos-Beneventi (Temuco, Chile), and were collected with the help of his colleague, Christian Salas-Eljatib.
#' @examples
#' data(radiatapl)
#' head(radiatapl)
'radiatapl'
