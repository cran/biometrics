#'  Tree-list (realistic-) data in a sample plot established in a 
#' *Eucalyptus globulus* plantation in southern Chile. 
#'
#' @description
#' Tree-level variables collected in a sample plot (area=500 m\eqn{^{2}}{^2}) 
#' in a forestry plantation of *Eucalyptus globulus* near Gorbea, in southern 
#' Chile. The variable height, was only measured in a sub-sample of 
#' trees within the plot. The plantation is 15 yr-old and had been subject to 
#' three thinnings.
#' @usage
#' data(eucaplotr)
#' @format The dataframe contains four variables as follows:
#' \describe{
#'   \item{dbh}{Diameter at breast height, in cm.}
#'   \item{health}{health status (1: good, 2: medium, 3: bad).}
#'   \item{shape}{stem shape for timber purposes (1: good, 2:
#' medium, 3: bad).}
#'   \item{crown.class}{Crown class (1: superior, 2: intermedium,
#' 3: lower).}
#'   \item{toth}{Total height (in m), only available for some trees.
#' Otherwise missing values are denoted by `NA`.}
#'  }
#' @source 
#' The data were provided courtesy of Dr 
#' Christian Salas-Eljatib (Universidad de Chile, Santiago, Chile).  
#' @references
#' - Forest biometrics lecture notes, Prof. Christian Salas-Eljatib,
#' Universidad de Chile. Santiago, Chile
#' @examples
#' data(eucaplotr)    
#' table(eucaplotr$shape)
#' library(datana) 
#' descstat(eucaplotr[,c("dbh","toth")])
"eucaplotr"
