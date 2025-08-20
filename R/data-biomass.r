#' Contains tree-level biomass data for four species in Canada.
#'
#' @description
#' These are tree-level variables for four species in Canada.
#'
#' @format Data contain the following columns:
#' \describe{
#'   \item{tree}{Tree number code.}
#'   \item{spp}{Species common name, as follows: `Balsam fir` is 
#'   _Abies balsamea_, `Black spruce` is _Picea mariana_, 
#'   `White birch` is _Betula papyrifera_, and `White spruce`
#'    is _Picea glauca_.}
#'   \item{dbh}{Diameter at breast height, in cm.}
#'   \item{toth}{Total height, in m.}
#'   \item{totbiom}{Total biomass, in kg.}
#'   \item{bolebiom}{Stem biomass, in kg.}
#'   \item{branchbiom}{Branches biomass, in kg.}
#'   \item{foliagebiom}{Foliage biomass, in kg.}
#'  }
#' @source
#' Data were provided by Prof. Timothy Gregoire, School of Forestry
#' and Environmental Studies, Yale University (New Haven, CT, USA).
#'
#' @examples
#' data(biomass)
#' head(biomass)
#' tapply(biomass$totbiom,biomass$spp,summary)
'biomass'
