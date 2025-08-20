#' Stand tables for Nothofagus alpina (rauli) forests
#'
#' @description
#' Stand tables for secondary Nothofagus alpina-dominated forests
#' in different locations in southern Chile.
#' @usage
#' data(standtabRauli)
#' @format The data has the following columns
#' \describe{
#' \item{site}{Study site.}
#' \item{sector}{Location within a study site.}
#' \item{low.cd}{Lower limit of the diameter class, in cm.}
#' \item{upp.cd}{Upper limit of the diameter class, in cm.}
#' \item{dclass}{Diameter class, in cm.}
#' \item{nha.dcl}{Tree density for the respective diameter class, in trees/ha.}
#' \item{forest.id}{Forest ID code, a combination of columns 'site' and
#'  'sector'.}
#'  }
#' @source
#' Tree density by diameter classes (i.e., stand table).
#' Data were digitized from table No. 4 of Wadsworth (1976).
#' @references
#' - Wadsworth RK. 1976. Aspectos ecologicos y crecimiento del
#'  rauli (Nothofagus alpina) y sus asociados en bosques de segundo crecimiento
#' de las provincias de Bio-Bio, Malleco y Cautin, Chile.
#' Boletin Tecnico No. 37, Fac. Cs. Forestales, Universidad de Chile,
#' Santiago, Chile.
#' @examples
#' data(standtabRauli)
#' head(standtabRauli)
#' df<-standtabRauli
#' table(df$site,df$sector,df$dclass)
"standtabRauli"
