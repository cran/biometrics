#' Computes stand-level variables for a given sample plot. The
#' variables are the following: density, basal area,
#' quadratic diameter diameter, average height, top height,
#' and stand volume.
#'
#' @details For a given imputed tree list of a sample plot, several
#' stand-level variales are computed. Note that the imputed-tree
#' list must have all the tree-level variables needed to obtain
#' the stand-level ones, such as, height, and volume. If there
#' remeasurement for a plot, the computation is by plot and
#' measurement year.
#'
#' @title Function to compute stand-level variables for a given
#' imputed-tree-list.
#' @param data data frame having the tree list of a sample plot.
#' @param plot.id a string having the plot code-number or unique
#' identificator.
#' @param plot.area column name having the plot area in m\eqn{^{2}}{^2}.
#' @param time a number of year of measurement, if not provided the
#' current year is assigned by default.
#' @param d a text of the column-name having the diameter at
#' breast-heigth. By default is assumed to be in cm. See option
#' `metrics` to change it to the imperial system.
#' @param h a text of the column-name having the total height
#' of the tree. By default is set to NA. If provided this variable
#' is assumed to be measured in meters. See option
#' `metrics` to use the imperial system.
#' @param y a string-vector with the name(s) of the tree-level
#' variable(s) to which aggregated stand variables are needed
#' to be computed. For example, volume is such a variable. By
#' default is set to `NA`, thus only stand basal area will be
#' computed. For instance, if is a vector, `y=c("vgross","vnet")`,
#' those variables must be present in the tree list as column names.
#' Notice that the resulting stand variable accronimg for each
#' variable will be "vgross.ha" and "vnet.ha", by default.
#' @param factvar a string having de name of the variable
#' used as factor. Each level of the 'factvar` is a category.
#' @param metric is a logic value, the default is to `TRUE`, thus
#' the diameter `d` has to be in cm, and the resulting tree-level
#' basal area will be in m\eqn{^{2}}{^2}. If `metric` is `FALSE`,
#' the diameter `d` has to be in inches, and the computed tree
#' basal area will be in ft\eqn{^{2}}{^2}.
#' @param eng logical; if `TRUE` (by default), the language of some
#' of the output-column names will be English; if "FALSE" will
#' be Spanish. For instance, the levels of the
#' factor-variable (`factvar`) is named "level"; otherwise will be
#' "nivel".
#' @param ... aditional options for basic stats functions.
#'
#' @return Returns a data frame with the the stand variables
#' per plot. If `factvar` is provided, the stand variables
#' will be a also computed for each level of the `factvar`.
#'  Dominant diameter and dominant height are computed using
#' the function `domvar()`.
#'
#' @author Christian Salas-Eljatib.
#' @references
#' - Salas-Eljatib C. 2025. Biometría y Modelación Forestal.
#'  Borrador de libro, en revisión. 352 p.
#'
#' @examples
#'
## Dataframe to be used
#' df<-biometrics::eucaplot2
#' #see the metadata by typing ?eucaplot2
#' head(df)
#' datana::descstat(df[,c("dap","atot")])
#' ## Preparing the treelist, in the required format
#' df$parce<-1;df$sup.plot<-500
#' ## Estimating tree-volume using an artifical factor form
#' df$vol<-gtree(x=df$dap)*df$atot*0.35
#' ## Using the function
#' standvar(data=df,plot.id="parce",plot.area="sup.plot",
#'          d="dap",h="atot",y="vol")
#' # Do the same as before, but adding the computation by a factor
#' standvar(data=df,plot.id="parce",plot.area="sup.plot",
#'          d="dap",h="atot",y="vol",factvar = "clase.copa")
#' ## More than one aggregated variable. For instance, adding biomass
#' ##  and tree carbon, aside of volume. A naive estimation
#' ##  of tree-biomass and carbon, could be 
#' df$biom<-df$v*420 #(kg/m3)
#' df$carb<-df$biom*0.5 #50% of biomass is carbon
#' df
#' standvar(data=df,plot.id="parce",plot.area="sup.plot",
#'          d="dap",h="atot",y=c("vol","biom","carb"))
#'  #what if the sample plot has a remeasurement
#' df$measu.yr<-2025;df$measu.yr[1:5]<-2020
#' df
#' #' ## Using the function per measurement year
#' standvar(data=df,plot.id="parce",plot.area="sup.plot",
#'          d="dap",h="atot",y=c("vol","biom","carb"),time="measu.yr")
#' # Do the same as before, but adding the computation by a factor
#' standvar(data=df,plot.id="parce",plot.area="sup.plot",
#'          d="dap",h="atot",y=c("vol","biom","carb"),time="measu.yr",
#'          factvar = "clase.copa")
#' # More than one plot
#' df<-biometrics::radiatapl2
#' table(df$parce)
#' ## naive imputation of tree-height
#' df[is.na(df$atot),"atot"]<-df[is.na(df$atot),"dap"]*0.8
#' ## Estimating tree-volume using an artifical factor form
#' df$vtot<-gtree(x=df$dap)*df$atot*0.35
#' datana::descstat(df[,c("dap","atot","vtot")])
#' df$sup.plot<-150
#' standvar(data=df,plot.id="parce",plot.area="sup.plot",
#'          d="dap",h="atot",y="vtot")
#' standvar(data=df,plot.id="parce",plot.area="sup.plot",
#'              d="dap",h="atot",y="vtot",factvar = "sanidad")
#' @rdname standvar
#' @export
#'
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
standvar <- function(data, plot.id, plot.area, time = NA, d, y,
   h= NA,factvar = NA, metric = TRUE, eng = TRUE, ...) {

    {if(eng==TRUE)factor.name<-"factor" else factor.name<-"factor"}
    {if(eng==TRUE)level.name<-"level" else level.name<-"nivel"}
    {if(eng==TRUE)none.name<-"None" else level.name<-"Ninguno"}
    {if(eng==TRUE)all.name<-"All" else level.name<-"Todos"}

##*(1a) Inicio de funcion interna-especifica clave =========
    ##-se define funcion base
    ##! importante que la estructura se mantenga!
    fxforestvar.body <- '
    function(dh) {
      data.frame(
        nha = sum(dh$fexp),
        gha = sum(dh$gtree.ha),
        dmean = mean(dh$d),
        dg = dg.fx(n = sum(dh$fexp), g = sum(dh$gtree.ha)),
        ddom = domvar(data = dh, varint = "d", varsort = "d", plot.area = mean(dh$plot.area)),
        hmean = mean(dh$h),
        hdom = domvar(data = dh, varint = "h", varsort = "h", plot.area = mean(dh$plot.area))
      )
    }
  '
    ##- la siguiente linea carga como funcion la string forestvar.body
    fxforestvar <- eval(parse(text = paste("fxforestvar <-", fxforestvar.body)))

    ##* Fin de funcion interna-especifica clave ===========

    df <- data
    df$plot.area <- df[, plot.area]
    df$fexp <- 10000 / df[, plot.area]
    df$d <- df[, d];    df$h <- df[, h]
    df$plot.id <- df[, plot.id]
    df$g <- gtree(x = df$d, metric = metric)
    df$gtree.ha <- df$g * df$fexp


##? Cuantas variables agregadas existen?
    num.variables <- length(unique(y))
    ##* Se modifica funcion clave si es que hay mas variables
    if (num.variables >= 1) {
        for (i in 1:num.variables) {
            name.aca <- paste(y[i], ".tree.ha", sep = "")
            name.vaca <- paste(y[i], ".ha", sep = "")
            df[[name.aca]] <- df[[y[i]]] * df$fexp
            text.h <- sprintf("%s = sum(dh$%s)", name.vaca, name.aca)
            tofx <- paste0("),\n ", text.h, "\n     )\n")
            fxforestvar.body <- sub(")\n\\s*)\n", tofx, fxforestvar.body)
        }
        fxforestvar <- eval(parse(text = paste("fxforestvar <-", fxforestvar.body)))
    }

    ##? Is there any factor-variable?
    catego <- prod(!is.na(factvar))
    catego

    if(is.na(time)){
        df$time <- as.numeric(format(Sys.Date(), "%Y"))
        time <- "time"
    }
    if (!is.na(time)) {
        df$time <- df[, time]
    }
    out <- c()
    out.factvar <- c()

    ##+ (1) Computing without seggregation
    by.keys <- c(plot.id, time); by.keys
    n.keys<-length(by.keys)
    out.i <- by(df[, ], df[, by.keys], fxforestvar)
    out <- array2DF(out.i, simplify = TRUE)
    head(out)
    names.stand.var.computed<-names(out[,(n.keys+1):ncol(out)])

##- Defining the number or NA to be assigned when NULL, wich happens
##-  when there are not sample size for the species/plot/time
null.to.change<-NA
num.stand.var.computed<-length(names.stand.var.computed)
zz<-data.frame(matrix(null.to.change,nrow=1,ncol=num.stand.var.computed))
names(zz)<-names.stand.var.computed

    ##+ (2) Computing per levels of the factor-variable
    if(catego == 1){
        df$factvar <- df[, factvar]
        cl.factvar <- unique(df$factvar)
        n.cate <- length(cl.factvar)
        by.keys <- c(plot.id, time, factvar)
        out.ij <- by(df[, ], df[, by.keys], fxforestvar)
        out.ij <- array2DF(out.ij, simplify = TRUE)
        num.keys<-length(by.keys)
        if(is.numeric(out.ij[,(num.keys+1)])){prob.null.out<-0}
        if(!is.numeric(out.ij[,(num.keys+1)])){prob.null.out<-1}
        prob.null.out
        ##- (i) Start of: caso con todos los niveles por parcela
        if(prob.null.out==0){
        col.h <- datana::findColumn.byname(out.ij, factvar)
        names(out.ij)[col.h] <- level.name
        out.ij[[factor.name]] <- factvar
        out.ij[[level.name]]<-as.factor(out.ij[[level.name]])
        out.factvar <- out.ij
         }##- End of(i): caso con todos los niveles por parcela
        ##- (ii) Start of: caso con NO todos los niveles por parcela
        if(prob.null.out==1){
            col.indexes<-out.ij[,-ncol(out.ij)]
            names(col.indexes)[length(by.keys)]<-level.name
            col.indexes[[level.name]]<-as.factor(col.indexes[[level.name]])
   out.ij$Value <- lapply(out.ij$Value, function(x) if (is.null(x)) zz else data.frame((x)))

   zzb<-data.frame(matrix(unlist(out.ij$Value),nrow=nrow(out.ij),
                          ncol=num.stand.var.computed,byrow=TRUE))
   names(zzb)<-names.stand.var.computed
    out.factvar <- cbind(col.indexes, zzb)
    }##- End of(ii): caso con NO todos los niveles por parcela
 out.factvar[[factor.name]] <- factvar
}#?- End of: catego==1

if(!is.na(factvar)){##+Start of: si hay una variable categorica
        out[[factor.name]] <- none.name
        out[[level.name]] <- all.name
        out <- rbind(out, out.factvar)
        ini.col <- datana::findColumn.byname(out, time) + 1
        ini.col
        end.col <- datana::findColumn.byname(out, factor.name) - 1
        end.col
        order.cols <- c(plot.id, time, factor.name, level.name)
        out1 <- out[, order.cols]
        out1
        out2 <- out[, ini.col:end.col]
        out2
        out <- cbind(out1, out2)
    } ##+ End of condition: si hay una variable categorica
    out <- out[order(out[, time], out[, plot.id]), ]
    if (!is.na(factvar)) {
        out <- out[order(out[, time], out[, plot.id], out[, level.name]), ]
    }
    out
}
