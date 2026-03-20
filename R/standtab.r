#' Creates a stand table, i.e. a table that describes the tree density
#' of a forest segregated by a tree-size variable `y`. The most common
#' example is to use diameter at breast-heigth (i.e., \eqn{d}) as the
#' variable, thus the resulting table is a way to describe the
#' diameter distribution.
#'
#'
#' @details For a given imputed tree list of a sample plot, tree
#' density is computed by classes of the tree-size variable. Note that
#' the imputed-tree list must have all the tree-level variables
#' needed to compute stand-level variables, such as, diameter and plot
#' size.
#'
#' @title Function to creates a stand for a given imputed-tree-list of
#' a sample plot.
#' @param data data frame having the tree list of a sample plot.
#' @param plot.area column name having the plot area in m\eqn{^{2}}{^2}.
#' @param y.for.class a text of the column-name having the tree-size variable to
#' be used to segregated the tree density.
#' @param yclass.amp a numeric value establishing the width of each
#' class of the variable `y.for.class`. The measurement unit must be
#' the same as the one of the variable `y.for.class`. 
#' @param metric is a logic value, the default is to `TRUE`, thus
#' the diameter `d` has to be in cm, and the resulting tree-level
#' basal area will be in m\eqn{^{2}}{^2}. If `metric` is `FALSE`,
#' the diameter `d` has to be in inches, and the computed tree
#' basal area will be in ft\eqn{^{2}}{^2}.
#' @param want.basal.area is a logic value, if set to `TRUE`,
#' the stand basal area, segregated by the classes of the`y.for.class`
#' is added as a column, next to the tree density one. The basal area
#' column by class is expressed in m\eqn{^{2}}{^2}/ha. The default
#' for this option is `FALSE`.
#' @param ... aditional options for basic stats functions.
#'
#' @return Returns a stand table.
#'
#' @author Christian Salas-Eljatib.
#' @references
#' - Salas-Eljatib C. 2025. Biometría y Modelación Forestal.
#'  Borrador de libro, en revisión. 352 p.
#'
#' @examples
#'
#' ## Dataframe to be used
#' df<-biometrics::eucaplot2
#' #see the metadata by typing ?eucaplot2
#' head(df)
#' datana::descstat(df[,c("dap","atot")])
#' ## Preparing the treelist, in the required format
#' df$parce<-1;df$sup.plot<-500;amp.diam=2;
#' out<-standtab(data=df,plot.area="sup.plot",y.for.class = "dap",
#'               yclass.amp = amp.diam)
#' out
#' #the following sum
#' sum(out$nha.class)
#' # must be equal to the stand-level density (in trees/ha)
#' df$expf<-10000/df$sup.plot;sum(df$expf)
#' # Do you want to add the stand basal area segregated by `y.for.class`
#' out2<-standtab(data=df,plot.area="sup.plot",y.for.class = "dap",
#'                yclass.amp = amp.diam, want.basal.area = TRUE)
#' out2
#' #the following sum
#' sum(out2$gha.class)
#' # must be equal to the stand-level basal area (in m2/ha)
#' df$g<-gtree(x=df$dap);df$gtree.ha<-df$g*df$expf;sum(df$gtree.ha)
#' @rdname standtab
#' @export
#'
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
standtab <- function(data, plot.area, y.for.class, yclass.amp,  metric = TRUE, 
    want.basal.area = FALSE, ...)
{
    df <- data
    df$plot.area <- df[, plot.area]    
    df$exp <- 10000/df$plot.area
    df <- datana::assigncl(data = df, variable = y.for.class, wclass = yclass.amp)
    name.yclass <- names(df[ncol(df)])
    col.h <- datana::findColumn.byname(df, name.yclass)
    df$y.class <- df[, col.h]
    out <- tapply(df$exp, df$y.class, sum)
    nha.class <- out
    y.class <- sort(as.numeric(names(nha.class)))
    out <- data.frame(y.class, nha.class)
    names(out)[1] <- name.yclass
    if(want.basal.area==TRUE){
    df$y.for.class <- df[, y.for.class]        
    df$g <- gtree(x = df$y.for.class, metric = metric)
    df$gtree.ha <- df$g * df$expf                   
    out2 <- tapply(df$gtree.ha, df$y.class, sum)
    gha.class <- out2
    out <- data.frame(y.class, nha.class,gha.class)
    names(out)[1] <- name.yclass
    }
    out
}
