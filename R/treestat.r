#' Computes several descriptive statistics of variables at
#' the tree-level per sample plot. It can also be be applied
#' to compute them by levels of factor within each available plot.
#'
#' @details For a given tree list of a sample plot, several
#' descriptive statistics are computed for the selected random
#' variables, by plot and measurement year. 
#'
#' @title Function to compute descriptive statistics at tree-level,
#' segregated by a factor (`factvar`) per sample plot.
#' @param data data frame having the tree list of a sample plot.
#' @param plot.id a string having the plot code-number or unique
#' identificator.
#' @param t a number of year of measurement, if not provided the
#' current year is assigned by default.
#' @param y a string-vector with the name(s) of the random
#' variable(s) to which the descriptive statistics will be
#' computed. By default uses `dbh` as the name of the variable.
#' @param factvar a string having de name of the variable
#' used as factor. Each level of the 'factvar` is a category.
#' @param t (optional) a time variable having the the measurement
#' year (in numeric or character format). The default is `NA`, in
#' which case the current year is assigned.
#' @param d (optional) a text with the name of the column of the
#' `data` having the diameter at breast-heigth. The default is `NA`.
#' If provided, it is assumed to be in cm. See option `metrics` to
#' change it to the imperial system.
#' @param full logical; if `TRUE`, the output includes some extra
#' descriptive statistics as explained in the datana::descstat()
#' function. The default is `FALSE`.
#' @param want.add.d logical; if `TRUE`, the computations will
#' include the diameter at breast-heigth defined in option `d`, as an
#' extra random variable to be added at the end of the vector `y`.
#' The default is `FALSE`.
#' @param want.add.g logical; if `TRUE`, the computations will
#' include the tree basal area, only possible if option `d` was
#' defined, as an extra random variable to be added at the end of
#' the vector `y`. The default is `FALSE`. 
#' @param short.names logical; if `TRUE`, the name of the
#' statistics are short names as explained in the datana::descstat()
#' function. The default is `FALSE`.
#' @param eng logical; if `TRUE` (by default), the language of some
#' of the output-column names will be English; if "FALSE" will
#' be Spanish. For instance, the levels of the
#' factor-variable (`factvar`) is named "level"; otherwise will be
#' "nivel".
#' @param metric is a logic value, the default is `TRUE`, thus
#' the diameter `d` has to be in cm, and the resulting tree-level
#' basal area will be in m\eqn{^{2}}{^2}. If `metric` is `FALSE`,
#' the diameter `d` has to be in inches, and the computed tree
#' basal area will be in ft\eqn{^{2}}{^2}.
#' @param ... aditional options for basic stats functions.
#'
#' @return Returns a data frame with the statistics per plot and
#' time for the selected y variables. If `factvar` is given, the
#' same statistics will be added but segregated by each level
#' (or category) of the `factvar`.
#'
#' @author Christian Salas-Eljatib.
#' @references
#' - Salas-Eljatib C. 2025. Biometría y Modelación Forestal.
#'  Borrador de libro, en revisión. 352 p.
#'
#' @examples
#'
#' # Dataframe to be used
#' df<-biometrics::eucaplot2
#' #?eucaplot2
#' head(df)
#' datana::descstat(df[,c("dap","atot")])
#' df$parce<-1
#' ## Using the function
#' treestat(data=df,plot.id="parce",y="atot")
#' # Now, for two random variables, instead of a single one 
#' treestat(data=df,plot.id="parce",y=c("dap","atot"))
#' # If the d is provided, Do you want to add both the diameter
#' # and the basal area (g), as random variables? 
#' treestat(data=df,plot.id="parce",y="atot",d="dap",want.add.d=TRUE,want.add.g=TRUE)
#' ## Do the same as before, but adding the computation by a factor
#' 
#' treestat(data=df,plot.id="parce",y="atot",factvar="clase.copa")
#' df$time<-2025;df$time[1:5]<-2020
#' df
#' ## Using the function per measurement year
#' treestat(data=df,plot.id="parce",y="atot",t="time",full=TRUE)
#' # Do the same as before, but adding the computation by a factor
#' treestat(data=df,plot.id="parce",y="atot",t="time",
#'          factvar="clase.copa",full = TRUE)
#' ## same as before, but for two random variables
#' treestat(data=df,plot.id="parce",y=c("dap","atot"),t="time",
#'           factvar="clase.copa",full = TRUE)
#' @rdname treestat
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
treestat <- function(data, plot.id, t = NA,
     y, d=NA, factvar = NA, full=FALSE,short.names=TRUE,
     metric = TRUE, eng=TRUE, want.add.d=FALSE, want.add.g=FALSE,...)
{

    if(eng==TRUE){gtree.name<-"g"}
    if(eng==FALSE){gtree.name<-"g"}
    
    if(eng==TRUE){factor.name<-"factor"}
    if(eng==FALSE){factor.name<-"factor"}
    if(eng==TRUE){level.name<-"level"}
    if(eng==FALSE){level.name<-"nivel"}

    if(eng==TRUE){none.name <- "None"}
    if(eng==FALSE){none.name <- "Ninguno"}
    if(eng==TRUE){all.name <- "All"}
    if(eng==FALSE){all.name <- "Todos"}

    if(eng==TRUE){message.no.dbh<-"The dbh column has not been specified"}
    if(eng==FALSE){message.no.dbh<-"La columna con el DAP no se ha especificado"}

    if(eng==TRUE){message.dbh<-"The dbh column has been specified"}
    if(eng==FALSE){message.dbh<-"La columna con el DAP se ha especificado"}

    
##- =============================    
##+ Inicio de funcion interna-especifica clave    
fxdescstatdf<-function(dh,...){
    data.frame(datana::descstat(dh,...))}
##+ termino de funcion clave
##- =============================
    
  df <- data

    if(!is.na(d)){we.have.dbh=1}
    if(is.na(d)){we.have.dbh=0}    
#    if(we.have.dbh==1){message(message.dbh)}
#    if(we.have.dbh==0){message(message.no.dbh)}
   
  if(we.have.dbh==1){
  df$d <- df[, d]
  df[[gtree.name]] <- gtree(x=df$d)
  }
    
  df$plot.id <- df[, plot.id]

##? Is there any factor-variable?
  catego <- prod(!is.na(factvar));catego
  
  if (is.na(t)) {
    df$t <-  as.numeric(format(Sys.Date(), "%Y"))
    t = "t"
  }  
  if (!is.na(t)) {df$t <- df[, t]}
  if(full==TRUE){reduced=FALSE}
  
    out<-c(); out.factvar<-c()

##+ ++++++++++++++++    
##+ Defining several messages to be sure on the process to be carried out    
##- caso donde agregamos d, en ingles
    if(want.add.d==TRUE & want.add.g==FALSE  & we.have.dbh==1  & eng==TRUE){message('---------\n Message: The dbh was specified to be the column named: "', d, '", which will be used accordingly. \n Thus, diameter will be added to the list of random variables.\n ---------')}
##- caso donde agregamos d, en castellano    
    if(want.add.d==TRUE & want.add.g==FALSE  & we.have.dbh==1 & eng==FALSE){message('---------\n Mensaje: El DAP fue especificado en la columna con nombre: "', d, '", la cual \n sera ocupada correspondientemente. Por lo tanto, el diametro sera \n agregado al listado de variables aleatorias.\n ---------')}

##- caso donde agregamos g, en ingles
    if(want.add.d==FALSE & want.add.g==TRUE & we.have.dbh==1  & eng==TRUE){message('---------\n Message: The dbh was specified to be the column named: "', d, '", which will be used accordingly.  \n Thus, the basal area will be added to the list of random variables, \n and will be computed based on the provided diameter.\n ---------')}
##- caso donde agregamos g, en Castellano
    if(want.add.d==FALSE & want.add.g==TRUE & we.have.dbh==1  & eng==FALSE){message('---------\n Mensaje: El DAP fue especificado en la columna con nombre: "', d, '", la cual \n sera ocupada correspondientemente.  Por lo tanto, el area basal (calculada a partir del DAP), \n sera agregada al listado de variables aleatorias.\n ---------')}

    
##- caso donde agregamos d y g, en ingles
    if(want.add.d==TRUE & want.add.g==TRUE & we.have.dbh==1  & eng==TRUE){message('---------\n Message: The dbh was specified to be the column named: "', d, '", which will be used accordingly.  \n Therefore, both diameter and basal area will be added to the list of random variables.\n ---------')}
##- caso donde agregamos d y g, en Castellano
    if(want.add.d==TRUE & want.add.g==TRUE & we.have.dbh==1  & eng==FALSE){message('---------\n Mensaje: El DAP fue especificado en la columna con nombre: "', d, '", la cual \n sera ocupada correspondientemente.  Por lo tanto, esta variable, asi como \n el area basal (calculada a partir del DAP), seran agregadas al listado de variables aleatorias.\n ---------')}
    
    if(want.add.d==TRUE & we.have.dbh==0  & eng==TRUE){stop('---------\n Error: You want to add dbh as a variable for the computations; however, \n  you did not provide the column name of that variable in option "d" of the function.\n ---------')}

    if(want.add.d==TRUE & we.have.dbh==0  & eng==FALSE){stop('---------\n Error: Ud. quiere agregar a la variable DAP para los calculos de la funcion, sin embargo, \n Ud. no ha especificado el nombre de la columna de dicha variable (en la opcion "d") en esta funcion.\n ---------')}
    
    if(want.add.g==TRUE & we.have.dbh==0  & eng==TRUE){stop('---------\n Error: You want to add g as a variable for the computations; however, you did not provided the column name of the dbh (in option "d"), internally used for computing tree basal area.\n ---------')}

    if(want.add.g==TRUE & we.have.dbh==0  & eng==FALSE){stop('---------\n Error: Ud. quiere agregar a la variable g (area basal) a los calculos a realizar por esta funcion, sin embargo, Ud. no ha especificado el nombre de la columna del DAP (en la opcion "d"), variable necesaria para calcular internamente a la variable g.\n ---------')}
##+ ++++++++++++++++
    
    if(want.add.d==TRUE & want.add.g==FALSE){y=c(y,d)}
    if(want.add.d==TRUE & want.add.g==TRUE){y=c(y,d,gtree.name)}
    if(want.add.d==FALSE & want.add.g==TRUE){y=c(y,gtree.name)}

    num.variables<-length(unique(y))
    
  for (i in 1:num.variables){
    df$y <- df[, y[i]]
    stat.names<-row.names(datana::descstat(df$y,full = full,short.names = short.names))
    stat.names
    num.of.stats<-length(stat.names);num.of.stats
    
##+ (1) Computing without seggregation
    by.keys <- c(plot.id,t);by.keys
    out.i<-by(df$y, df[,by.keys], fxdescstatdf,full=full,
              short.names=short.names,landscape=TRUE)
    head(out.i)
    out.i<-array2DF(out.i,simplify = TRUE)
    names(out.i)<-c(by.keys,paste(stat.names, ".", y[i],sep = ""))

    if(!is.null(out)){out <- merge(out, out.i, by = c(plot.id, t))}
    if(is.null(out)){out<-out.i}
  }
dim(out)
    head(out)
##- Defining the number or NA to be assigned when NULL, wich happens
##-  when there are not sample size for the species/plot/time     
null.to.change<-NA
zz<-data.frame(matrix(null.to.change,nrow=1,ncol=num.of.stats))
names(zz)<-stat.names

#df2 <- with(df, expand.grid(plot.id = unique(plot.id),
#                 t = unique(t),factvar=unique(factvar)))
#df3 <- merge(df, df2, all.y = TRUE)
#df3[1:59,c("plot.id","spp.name","d")]                            
##+ (2) Computing per levels of the factor-variable     
 if (catego == 1){
    df$factvar <- df[, factvar]
    cl.factvar<-unique(df$factvar)
    n.cate<-length(cl.factvar);n.cate                
    for (i in 1:length(unique(y))){##* Start of loop: for the y[i]-variable
        df$y <- df[, y[i]]    
        by.keys <- c(plot.id,t,factvar);by.keys
out.ij<-by(df$y, df[,by.keys], fxdescstatdf,full=full,
           short.names=short.names,landscape=TRUE)
out.ij<-array2DF(out.ij)#,simplify = TRUE)        
        head(out.ij)
        num.keys<-length(by.keys)

        if(is.numeric(out.ij[,(num.keys+1)])){prob.null.out<-0}
        if(!is.numeric(out.ij[,(num.keys+1)])){prob.null.out<-1}
        prob.null.out
        out.ij
##- Start Divergencia: caso con todos los niveles por parcela    
        if(prob.null.out==0){
            names(out.ij)<-c(by.keys,paste(stat.names, ".", y[i],sep = ""))
            if(!is.null(out.factvar)){out.factvar <- merge(out.factvar, out.ij, by = c(plot.id, t,factvar))}
            if(is.null(out.factvar)){out.factvar<-out.ij}
         }
##- End Divergencia: caso con todos los niveles por parcela            

##- Start Divergencia: caso con NO todos los niveles por parcela            
        if(prob.null.out==1){
         out.ij$Value <- lapply(out.ij$Value, function(x) if (is.null(x)) zz else data.frame((x)))
##? Start of: Lo siguiente hazlo exclusivamente para el caso cuando i=1
         if(i==1){
         col.indexes<-out.ij[,-ncol(out.ij)]
         names(col.indexes)[length(by.keys)]<-level.name
         col.indexes[[level.name]]<-as.factor(col.indexes[[level.name]])
         }        
##? End of: Lo siguiente hazlo exclusivamente para el caso cuando i=1
    zzb<-data.frame(matrix(unlist(out.ij$Value),nrow=nrow(out.ij),
                           ncol=num.of.stats,byrow=TRUE))
    zzb[is.na(zzb$X1),"X1"]<-0 #this always be the sample size
    names(zzb)<-paste(stat.names, ".", y[i],sep = "")#stat.names
             
 if(!is.null(out.factvar)){out.factvar <- cbind(out.factvar, zzb)}
 if(is.null(out.factvar)){out.factvar<-cbind(col.indexes,zzb)}
         }
##- End Divergencia: caso con NO todos los niveles por parcela 
##    out.factvar<-cbind(col.indexes,out.factvar)
#    out.factvar[[factor.name]] <- factvar
#    #    out.factvar$factor<-factvar
    } ##* End of loop: for the y[i]-variable
    out.factvar[[factor.name]] <- factvar
    if(prob.null.out==0){        
    col.h<-datana::findColumn.byname(out.factvar,factvar);col.h
    names(out.factvar)[col.h]<-level.name
                   }        

 } ##+ End of condition of catego==1

    out.factvar
    out
if(!is.na(factvar)){##+Start of: si hay una variable categorica
out[[factor.name]] <- none.name
out[[level.name]] <- all.name
  out <- rbind(out, out.factvar)
  ini.col<-datana::findColumn.byname(out,t)+1;ini.col
  end.col<-datana::findColumn.byname(out,factor.name)-1;end.col
   ## if(eng==TRUE){order.cols<-c(plot.id,t,"factor","level")}
   ## if(eng==FALSE){order.cols<-c(plot.id,t,"factor","nivel")}
order.cols<-c(plot.id,t,factor.name,level.name)
out1<-out[,order.cols];out1
 out2<-out[,ini.col:end.col];out2 
  out<-cbind(out1,out2)
}  ##+ End of: si hay una variable categorica
out<-out[order(out[,t],out[,plot.id]),]
if(!is.na(factvar)){  
#if(eng==TRUE){out<-out[order(out[,t],out[,plot.id],out[,"level"]),]} 
#if(eng==FALSE){out<-out[order(out[,t],out[,plot.id],out[,"nivel"]),]}
out<-out[order(out[,t],out[,plot.id],out[,level.name]),]
}
out
#head(out,19)    
}
