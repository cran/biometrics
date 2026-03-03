#' Computes the so-called dominant stand-level variable,
#' corresponding to the average of a tree-level variable for
#' the `nref.ha` largest sorting-tree-level diameter trees in 1-ha.
#'
#' @details The original function was written by Dr Oscar García for computing
#' top height, and the corresponding reference is provided. Nevertheless,
#' several changes were applied, to make the current function provide a broader
#' application. Regardless, the function aims to calculate a "dominant"
#' stand-level variable by taking into account the plot area.
#' Thus, requires having a dataframe having both the variable
#' of interest (e.g., height) and the sorting variable used for the
#'  computation (e.g., diameter) for all trees in a sample plot, as well as,
#' the plot area.
#'
#' @title Function to compute a dominant stand-level variable based on
#' a sample plot data.
#' @param data the tree-list dataframe of a sample plot, having
#' at least column `varint`. 
#' @param varint The column name of the data having the tree-level variable of
#'  interest (e.g., "toth"). Can be entered as the actual name, without the
#'  need of using quotation marks.
#' @param varsort The column name of the data having the tree-level variable
#' to be used as reference (e.g., "dbh") for defining the sorting variable
#'  of interest. If there is only data for the `varint` column,
#' colum `varsort` can be the same as in `varint`.
#' @param plot.area A numeric value of the plot area in m\eqn{^{2}}{^2}.
#' Notice that in a tree list, the plot area is also a column, thus,
#' the option `plot.area` can also be the column name where the
#' surface of the plot is keept. In such a case, the area to be used
#' for the computation is the average of the plot. 
#' @param ndom.ha It is the number of trees/ha used as reference. By default `ndom.ha` is set to 100..
#'
#' @return The main output is the calculated dominant stand-variable for the
#' given sample plot. The unit of the computed variable is the same as the
#' one used as variable of interest.
#'
#' @author Christian Salas-Eljatib.
#' @references
#' - García O, Batho A. 2005. Top height estimation in lodgepole pine
#'  sample plots. Western Journal of Applied forestry 20(1):64-68.
#'
#' @examples
#'
#' # Dataframe to be used
#' df<-biometrics::eucaplot2
#' #' ?eucaplot2
#' #' head(df)
#' datana::descstat(df[,c("dap","atot")])
#' #' # Using the domvar function
#' domvar(data=df,varint = "atot",varsort = "atot",plot.area = 500)
#' domvar(data=df,varint = "atot",varsort = "dap",plot.area = 500)
#' domvar(data=df,varint = "atot",varsort = "dap",plot.area = 500,ndom.ha = 50)
#' 
#' @rdname domvar
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
domvar <- function(data,varint,varsort, plot.area,ndom.ha=100){
        df<-data
        df$y<-df[,varint];df$x<-df[,varsort]
## vector of the random variable of interest, sorted by
## increasing the variable used to sort the data         
        sorty<-df[order(df$x,decreasing = FALSE),"y"];
        plot.ha<-plot.area/10000; plot.ha
        ares<-ndom.ha*plot.ha
#   ares: plot area in ares (1 hectare = 100 ares)
    m <- length(sorty) / ares
    mlo <- floor(m)
    mhi <- ceiling(m)
    u.hat <- uestimator(sorty, mlo)
    if (mhi == mlo) return(u.hat)
    (mhi - m) * u.hat + (m - mlo) * uestimator(sorty, mhi)
}
