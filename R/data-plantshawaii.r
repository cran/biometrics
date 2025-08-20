#' Maximum plant size in the Hawaiian archipelago
#' @description
#' Maximum plant size of 58 tree species, shrub and tree fern species that
#'  occur
#' in 530 forest plots across the Hawaiian archipelago.
#' @usage
#' data(plantshawaii)
#' @format Contains six columns, as follows:
#' \describe{
#'   \item{species}{Genus and epithet of the species.}
#'   \item{family}{Family of each species.}
#' \item{native.status}{Categorical variable (`native`, `alien`, `uncertain`)
#'  indicating alien status of each individual following Wagner _et al._ (2005).}
#' \item{n}{Number of individuals used to estimate maximum plant size.}
#' \item{d95}{Maximum plant size, estimated as `D950.1` (King _et al._ 2006).}
#' \item{dmax3}{Maximum plant size, estimated as `Dmax3` (King _et al._ 2006).}
#'  }
#' @source
#' The data were obtained from the DRYAD repository
#' at \doi{10.5061/dryad.1kk02qr}.
#' @references
#' - Craven D, Knight T, Barton K, Bialic-Murphy L, Cordell S,
#' Giardina C, Gillespie T, Ostertag R, Sack L,Chase
#' J. 2018. OpenNahele: the open Hawaiian forest plot
#' database. Biodiversity Data Journal 6: e28406.
#' 
#' @examples
#' data(plantshawaii)
#' head(plantshawaii)
#' tapply(plantshawaii$d95,plantshawaii$native.status,summary)
'plantshawaii'
