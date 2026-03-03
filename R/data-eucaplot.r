#'  Tree-level data from a sample plot established in a *Eucalyptus globulus*
#'  plantation
#'
#' @description
#' Tree-level variables collected for all trees (even the variable height) 
#' within a sample plot in a forestry plantation of *Eucalyptus globulus* near
#'  Gorbea, southern Chile. The plot size is 500 m\eqn{^{2}}{^2}. 
#'  The plantation is 15 yr-old and had been subject to three thinnings.
#' @usage
#' data(eucaplot)
#' @format The dataframe contains four variables as follows:
#' \describe{
#'   \item{dbh}{Diameter at breast height, in cm.}
#'   \item{health}{health status (1: good, 2: medium, 3: bad).}
#'   \item{shape}{stem shape for timber purposes (1: good, 2: medium, 3: bad).}
#'   \item{crown.class}{Crown class (1: superior, 2: intermedium, 3: lower).}
#'   \item{toth}{Total height, in m.}
#'  }
#' @source 
#' The data were provided courtesy of Dr 
#' Christian Salas-Eljatib (Universidad de Chile, Santiago, Chile).  
#' @references
#' - Forest biometrics lecture notes, Prof. Christian Salas-Eljatib,
#' Universidad de Chile. Santiago, Chile
#' @examples
#' data(eucaplot)    
#' table(eucaplot$health)
#' library(datana) 
#' descstat(eucaplot[,c("dbh","toth")])
"eucaplot"
