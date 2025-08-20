#' Population of stand-volume for 400 elements.
#'
#' @description
#' The data corresponds to a list of 400 elements of a population of
#' the variable forest volume (in m\eqn{^{3}}{^3}/ha) measured in field plots
#' of 0.1 ha of area. Therefore, the data emerge from a grid of 20 rows by
#'  20 columns, completely covering a forest of 40 ha.
#' @usage
#' data(popvol)
#' @format Contains two variables, as follows:
#' \describe{
#'   \item{plot.id}{Plot number, or ID.}
#' \item{vol}{Stand volume, in m\eqn{^{3}}{^3}/ha}
#'  }
#' @source
#' The values were digitized from Table No. 11 of Zohrer (1980), which is
#' actually based upon Loetsch and Haller (1964).
#' @references
#' - Zohrer F. 1980. Forstinventur. Ein Leitfaden fur Studium und
#' Praxis. Pareys Studientexte Nr. 26. Parey. Berlin, Germany. 207
#'
#' - Loetsch F, Haller KE. 1964. Forest inventory.  Volume 1. 
#' Bayerischer Landwirtschaftsverlag Gmbh. Munchen, Germany. 436 p.
#'
#' @examples
#' data(popvol)
#' sum(popvol$vol)
#' mean(popvol$vol)
#' hist(popvol$vol)
'popvol'
