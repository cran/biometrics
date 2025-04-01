#' Computes the so-called dominant stand-level variable, corresponding 
#' to the average of a tree-level variable for the 100 largest 
#' sorting-tree-level diameter trees in 1-ha. 
#'  
#' @details The original function was written by Dr Oscar García for computing
#' top height, and the corresponding reference is provided. Nevertheless, 
#' several changes were applied, thus the current function provide a broader
#' application. Regardless, the function aims to calculate a "dominant" 
#' stand-level variable by taking into account the plot area. 
#' Thus, requires having a dataframe having both the variable
#' of interest (e.g., height) and the sorting variable used for the
#'  computation (e.g., diameter) for all trees in a sample plot, as well as, 
#' the plot area.
#' 
#' @title Function to compute the dominant stand-level variable based on a sample plot data. 
#' @param data data frame having the tree list of a sample plot.
#' @param var.int column name with the tree-level variable of interest (e.g., height).
#' @param var.sort column name with the tree-level variable for defining the
#' @param plot.area column name having the plot area, in square meters.
#'
#' @return The main output is the calculated dominant stand-variable for the
#' given sample plot. 
#'  
#' @author Christian Salas-Eljatib.
#' @references
#' - Garcia O, Batho A. 2005. Top height estimation in lodgepole pine
#'  sample plots. Western Journal of Applied forestry 20(1):64-68.
#' 
#' @examples
#'
#' ##Creates a fake dataframe
#' set.seed(45)
#' x <- round(rnorm(20,mean=45,sd=10),1); y=round(1.3+35*(1-exp(-.07*x)),1)
#' df<-data.frame(dap=x,atot=y)
#' head(df)
#' datana::descstat(df)
#' ##Using the domvar function
#' domvar(data=df,var.int="atot",var.sort="dap",plot.area=500)
#' @rdname domvar
#' @export
#' 
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
domvar <- function(data = data, var.int = var.int, 
  var.sort = var.sort, plot.area=plot.area){
  fac.conv.ha.to.are<-100 #esto actua como el nref.ha
  df <- data;
  df$y <- df[, var.int];df$x <- df[, var.sort]
  area.m2 <- plot.area#df$area <- df[, plot.area]
  exp.fac<-10000/area.m2; plot.area.ha<-1/exp.fac
  plot.area.ares<-plot.area.ha*fac.conv.ha.to.are
  num.arb.nece<-fac.conv.ha.to.are*plot.area.ha
  ##sort tree heights according to their diameters
  tab.h <- df[ order(-df$x), c("x","y")]
  y.by.sortx<-tab.h$y #heights.sort.by.dbh
  ##
  m <- length(y.by.sortx) / plot.area.ares
  mlo <- floor(m)
  mhi <- ceiling(m)
  U <- uestimator(y.by.sortx=y.by.sortx, mlo)
  if (mhi == mlo) return(U)
  (mhi - m) * U + (m - mlo) * uestimator(y.by.sortx, mhi)
}   
