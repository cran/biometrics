#!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#* Function: "creaIncrData"                                             #
# It creates an increment data from a time series data frame           #
# How this function works?:                                            #
# > creaIncrData(data, time, unit.id, multi.time, n.measu)             #
#                                                                      #
#? Where:                                                               #
# - data: data frame having the time series data                       #
# - time: column name having the time vector                           #
# - unit.id: column name containing the info of the observational unit #
# - multi.time: logical value for creating the data frame: add         #
#     FALSE if you only want increment succesive pairs, otherwise add  #
#     TRUE if you want all possible combinatios.                       #
# - n.measu: logical value for adding a column with the total number of#
#     measurement on time for a given observational unit.              #
# - identifica.simple: incr.sim 0 or 1                                 #
# - static.columns: columns that do not change                         #
#                                                                      #
#> Created  by: Christian Salas & Joaquin Riquelme                      #
#- Date: feb19, 2020                                                    # 
# Santiago, Chile                                                      #
#!----------------------------------------------------------------------#
creaIncrData<-function(data,time,unit.id,multi.time=F,n.measu=T,
  identifica.simple=F,static.columns=NA){
  db0<-data
  
  if(prod(!is.na(static.columns))){
    db0.static <- db0[,c(unit.id, static.columns)]
    db0.static <- unique(db0.static)
    if(nrow(db0.static)>length(unique(db0[,c(unit.id)]))){
      warning("Error in static column-variables")
    }
    db0 <-db0[,setdiff(names(db0),static.columns)]}else{nada=22}
  
  if(multi.time==F){identifica.simple=F}
  
  measurements <- tapply(db0[,time], db0[,unit.id], length)
  measure <- data.frame(cbind(measurements))
  measure[,unit.id] <- row.names(measure)
  db0 <- merge(db0, measure, by=unit.id)
  
  db <- subset(db0, measurements>1)
  
  n.wo.r <- nrow(db0)-nrow(db) # number of observations without remeasuremts
  
  cat(n.wo.r, "Observations do not have remeasurements \n")
  # data a ser poblada con todas las filas
  db.f<-data.frame()
  
  # ciclo por cada individuo de la base de datos
  for (i in unique(db[,unit.id])){
    
    # subset de data del individuo i
    db.s<-db[db[,unit.id]==i,]
    
    # if(nrow(db.s) < 2){ 
    # cat("Observation ", i, " does not have remeasurements \n")}
    # else {nada=999}
    
    # if(nrow(db.s)>1){
    cat("Processing observation ", i, "\n")
    # ordena base de datos en orden de tiempo creciente
    db.s<-db.s[order(db.s[,time]),]
    
    # genera matriz de todas las posibles combinaciones de pares de tiempos
    if(multi.time==T){combi<-gtools::combinations(n=nrow(db.s), r=2, v=db.s[,time])}
    else{#nada=999}
      #if(multi.time==F){
      combi<-cbind(db.s[1:(nrow(db.s)-1),time],db.s[2:(nrow(db.s)),time])}
    #else{nada=999}
    
    # base de datos a ser poblada para el individuo i
    db.i<-data.frame()
    
    # ciclo por cada fila de la matriz combi
    for (j in 1:nrow(combi)){
      # fila con t0 de la fila j
      db.0<-db.s[db.s[,time]==combi[j,1],]
      # fila con t1 de la fila j
      db.1<-db.s[db.s[,time]==combi[j,2],]   # db.1<-subset(db, t==combi[j,2])
      
      # con merge se unen db.0 y db.1, se establecen los sufijos de cada variable
      db.j<-merge(db.0, db.1, by=unit.id, suffixes=c(".0",".1"))
      
      # se une la fila creada a la base de datos de cada individuo
      db.i<-rbind(db.i,db.j)                              
    }
    # se une la base de datos de i a la data final
    # se une la base de datos de i a la data final
    if(n.measu==T){      
      db.i$tot.n.measure<-nrow(db.s)
    } else {no.worries=1}
    if(identifica.simple==T){
      conc <- c(1)
      n <- nrow(db.s)
      a <- n-1
      while(a>1){
        m <- conc[length(conc)]+a
        conc <- c(conc,m)
        a <- a-1
      }
      db.i$incr.sim <- 0
      db.i$incr.sim[conc] <- 1
    }
    db.i <- db.i[,-c(match(c("measurements.0","measurements.1"),names(db.i)))]
    db.f<-rbind(db.f,db.i)
  }
  # else{nada=999}
  # }
  
  
  # change the colnames of the time 
  colnames(db.f)[colnames(db.f) == paste(time,".0",sep="")]<-"t.0"
  colnames(db.f)[colnames(db.f) == paste(time,".1",sep="")]<-"t.1"
  
  # reorder the data
  if(n.measu==T){       
    db.f<-db.f[,c(unit.id,"tot.n.measure","t.0","t.1",
                  sort(colnames(db.f)[!is.element(colnames(db.f),c(unit.id,"tot.n.measure","t.0","t.1"))]))]} else {
                    db.f<-db.f[,c(unit.id,"t.0","t.1",
                                  sort(colnames(db.f)[!is.element(colnames(db.f),c(unit.id,"t.0","t.1"))]))]  }
  
  
  if(prod(!is.na(static.columns))){ db.f <- merge(db0.static, db.f, by=unit.id)}
  db.f
}
#---------------------------
## how to use this function?
# Creating an example dataframe
# observation ID column
# id <- rep(1,5)
# ## time variable column
# t <- c(1980,1990,1999,2011,2018)
# ## X and Y variables (can be factors too)
# x <- c(2, 2.5, 3, 3.4, 3.6)
# y <- c(20, 22, 25, 26, 28)
# ## a static variable
# z <- c("nob","nob","nob","nob","nob")
# 
# ## creating data frame
# db<-data.frame(id,t,x,y,z)
# db
# str(db)
# 
# ## using the function
# # alternative 1. increment-succesive data
# creaIncrData(data = db, time = "t", unit.id = "id", multi.time = T,
#             n.measu = F, identifica.simple = F, static.columns = "z")
# # alternative 2. all possible increment data
# creaIncrData(data = db, time = "t", unit.id = "id", multi.time = T, n.measu = T, static.columns = "z")

#!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
