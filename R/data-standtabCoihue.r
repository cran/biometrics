#' Stand table for a _Nothofagus dombeyi_ (coihue) forest
#'
#' @description
#' Stand table for a secondary forest of _Nothofagus dombeyi_
#' (coihue) en  Chile.
#' @usage
#' data(standtabCoihue)
#' @format The data has the following columns
#' \describe{
#' \item{diam.cl}{Diameter class, in cm.}
#' \item{nha}{Density for the respective diameter class,
#' in trees/ha.}
#' \item{gha}{Basal area for the respective diameter class,
#' in m\eqn{^{2}}{^2}/ha.}
#'  }
#' @source
#' The forest was located in the Andean foothills in the Araucanía
#' region in southern Chile. Data from Prof. Christian
#' Salas-Eljatib, Universidad de Chile, Santiago, Chile.
#' @references
#' - Donoso C. 1995. Bosques Templados de Chile y Argentina.
#' Editorial Universitaria. Santiago, Chile.
#' @examples
#' data(standtabCoihue)
#' df<-standtabCoihue
#' df<-df[-nrow(df),]
#' # Diameter distribution plot 
#' barplot(df$nha, legend = TRUE, beside = TRUE, las=1,
#'         names.arg = as.numeric(df$diam.cl),
#'         ylab="Density (trees/ha)",xlab="Diameter class (cm)")
#' abline(h=0)
"standtabCoihue"
