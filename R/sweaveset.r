sweaveset<-function(sweave.fold='SweaveTeXBib',docs.fold="docs",          fig.fold="figures",fig.imag='images',r.fold="r",data.fold="data",          datao.fold="dataouts",out.fold="outs",tab.fold="tables",gis.fold="gisFiles",defigralh.fold="defiFilesGralHere",trash.fold='xnotreallyneeded')
{
#-------------------------------------------------------------------
 # File: sweaveset.R
 # R file with the default Sweave settings
 #
 # Here we define the sub-folders to be used when using sweavetexOrde.R
 ## Pre-last changes: Dec 16, 2009
 ## Last changes: feb25, 2026    
##- ----------------------------------------------------

   
##? Where is the folder where is the base Sweave file (*.Rnw)
    cur.path<-cur.dirb<-"../"    


##? subdirectory for Sweave files
    subDirectorySw <- sweave.fold #'SweaveTeXBib'#
    len.mainfold<- nchar(subDirectorySw)

    root.folder<-datana::extractRight(cur.path,len.mainfold)    
    if(root.folder==subDirectorySw){run.from.sw.folder=1} else {run.from.sw.folder=0}
    
##? subdirectory for documents
subDirectoryDocs <- docs.fold#'docs'#
##? subdirectory for figures
subDirectoryF <- fig.fold#'figures'#
##?subdirectory for images Fixed (not created from the R process)
subDirectoryI <- fig.imag
##? subdirectory for R scripts
subDirectoryR <- r.fold#'r' #
##? subdirectory for Data
subDirectoryData <- data.fold#'data' #
##? subdirectory for DataOuts
subDirectoryDataO <- datao.fold#'dataouts' #
##? subdirectory for Outputs
subDirectoryO <- out.fold# 'outs' #
##? subdirectory for LaTeX tables
subDirectoryT<- tab.fold# 'tables' #
##? subdirectory for leaving all the rest files
subDirectoryBasu<- trash.fold# 'xnotreallyneeded' #
##? subdirectory for gis files
subDirectoryGis<- gis.fold# 'gisData' #
##? subdirectory for files with general definitions being used here
subDirectoryDefh<- defigralh.fold# 
    
##* en caso que lo corra desde el Sweave main folder
if(run.from.sw.folder==1){    
if(is.null(subDirectorySw)){
       filePathSw <- getwd()} else {
       filePathSw <- cur.dirb}
}

##* en caso que no lo corra desde el Sweave main folder
if(run.from.sw.folder==0){
if(is.null(subDirectorySw)){
       filePathSw <- getwd()} else {
       filePathSw <- file.path(cur.dirb, subDirectorySw)}    
}

if(is.null(subDirectoryDocs)){
       filePathDocs <- getwd()} else {
       filePathDocs <- file.path(cur.dirb, subDirectoryDocs)}

##+ subdirectory for figures    
if(is.null(subDirectoryF)){
       filePathF <- getwd()} else {
       filePathF <- file.path(cur.dirb, subDirectoryF)}         

##+ subdirectory for images   
if(is.null(subDirectoryI)){
       filePathI <- getwd()} else {
       filePathI <- file.path(cur.dirb, subDirectoryI)}

##+ subdirectory for R scripts    
if(is.null(subDirectoryR)){
       filePathR <- getwd()} else {
       filePathR <- file.path(cur.dirb, subDirectoryR)}         

##+ subdirectory for Data    
if(is.null(subDirectoryData)){
       filePathData <- getwd()} else {
       filePathData <- file.path(cur.dirb, subDirectoryData)}         

##+ subdirectory for Data outputs    
if(is.null(subDirectoryDataO)){
       filePathDataO <- getwd()} else {
       filePathDataO <- file.path(cur.dirb, subDirectoryDataO)}         


##+ subdirectory for Outputs    
if(is.null(subDirectoryO)){
       filePathO <- getwd()} else {
       filePathO <- file.path(cur.dirb, subDirectoryO)}         

filePathO.f <-paste(cur.dirb, subDirectoryO,sep = "/")

##+ subdirectory for Tables    
if(is.null(subDirectoryT)){
       filePathT <- getwd()} else {
       filePathT <- file.path(cur.dirb, subDirectoryT)}         

if(is.null(subDirectoryBasu)){
       filePathBasu <- getwd()} else {
       filePathBasu <- file.path(cur.dirb, subDirectoryBasu)}         

##+ subdirectory for Gis/geographic stuff    
if(is.null(subDirectoryGis)){
       filePathGis <- getwd()} else {
       filePathGis <- file.path(cur.dirb, subDirectoryGis)}         

##+ subDirectory for general definitions    
if(is.null(subDirectoryDefh)){
       filePathDefh <- getwd()} else {
       filePathDefh <- file.path(cur.dirb, subDirectoryDefh)}
    
##+ ===================================================
##! Defining the paths as objects to be used later
##+ ===================================================

sw.dir<-NULL;
cur.dirb<-NULL;fig.dir<-NULL;r.dir<-NULL;
docs.dir<-NULL;data.dir<-NULL;datao.dir<-NULL;
    out.dir<-NULL;out.dir.f<-NULL;tab.dir<-NULL;
    basu.dir<-NULL;gis.dir<-NULL;defigralh.dir<-NULL


#assign("cur.dirb",cur.path, envir = .GlobalEnv)
#assign("cur.dirb",cur.path)#,envir = environment(biometrics))#    
cur.dirb<<-cur.path 
#assign("sw.dir",filePathSw)#, envir = environment(sweaveset))#.GlobalEnv)  
sw.dir<<-filePathSw
##assign("sw.dir",filePathSw , envir = .GlobalEnv) 
#assign("fig.dir",filePathF,envir = environment(sweaveset))## , envir = .GlobalEnv)    
fig.dir<<- filePathF
#assign("r.dir",filePathR, envir = environment(sweaveset))## , envir = .GlobalEnv)
r.dir<<- filePathR
#assign("docs.dir",filePathDocs, envir = environment(sweaveset))## , envir = .GlobalEnv)    
docs.dir<<- filePathDocs
#assign("data.dir",filePathData, envir = environment(sweaveset))## , envir = .GlobalEnv)    
data.dir<<- filePathData
#assign("datao.dir",filePathDataO, envir = environment(sweaveset))## , envir = .GlobalEnv)        
datao.dir<<- filePathDataO
#assign("out.dir",filePathO, envir = environment(sweaveset))## , envir = .GlobalEnv)
out.dir<<- filePathO
#assign("out.dir.f",filePathO.f, envir = environment(sweaveset))##, envir = .GlobalEnv)
out.dir.f<<- filePathO.f    
#assign("tab.dir",filePathT, envir = environment(sweaveset))##, envir = .GlobalEnv)
tab.dir<<- filePathT
#assign("basu.dir",filePathBasu, envir = environment(sweaveset))##, envir = .GlobalEnv)
basu.dir<<- filePathBasu
#assign("gis.dir",filePathGis, envir = environment(sweaveset))##, envir = .GlobalEnv)
gis.dir<<- filePathGis
defigralh.dir<<- filePathDefh    
}
