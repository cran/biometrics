Sweavetex<-function(filename,outname=NA,extension='Rnw',
                    command='pdflatex',silent=FALSE,preview=FALSE,
                    root.filename=NA,root.filename2=NA)
{    
##- ----------------------------------------------------------------
#  A nice little routine to run any Sweave script in order to
#   obtain a .tex file, which is first checked for bibliog.references,
#   and then a pdf file is produced
#
#  Arguments...
#    fileName = an rnw file name 
#
#  Returns...
#    pdflatex command invisibly
#
#  Author: Jeff Gove, modified by   
#   C. Salas	christian.salas@yale.edu         August 16 2008
#   C. Salas	christian.salas@uchile.cl         dec3, 2025  
#-------------------------------------------------------------------------------  
        if (command=='latex') command='simpdftex latex --maxpfb'
        extension<-paste('.',extension,sep='')
        path<-options('latexcmd')[[1]]
        path<-substr(path,start=1,stop=nchar(path)-5)
# generate the .tex file with Sweave
        Sweave(paste(filename,extension,sep=''))
#
# run BibTeX...
        cat('\nRunning  BibTeX...\n')        
        system(paste(path,'bibtex',' ',filename,sep=''),intern=silent)
#
# run pdfLaTeX...
        cat('\nRunning pdfLaTeX (Sweavetex function!...\n')        
        system(paste(path,command,' ',filename,sep=''),intern=silent)
#        if (command=='latex')
#        {
#                system(paste(path,'dvipdfm',' ',filename,sep=''))
                                        #        }

##+ =============================
##+ Portion for chanching the name of the pdf-file output     
 # lsobj.aqui<-mget(ls(), .GlobalEnv) 
  exist.name1<-exist.name2<-analizar.cambio.nombre<-cambiar.nombre.pdf<-0
 # if(length(lsobj.aqui[["root.filename"]])!=0){exist.name1<-1}
 # if(length(lsobj.aqui[["root.filename2"]])!=0){exist.name2<-1}
  
  if(exists("root.filename")){exist.name1<-1}
  if(exists("root.filename2")){exist.name2<-1}
  
  if(exist.name1==1){assign("base.file",root.filename)}
  if(exist.name2==1){assign("new.file",root.filename2)}
  
  if(exist.name1==1 & exist.name2==1){analizar.cambio.nombre<-1}
  if(analizar.cambio.nombre==1){
    if(base.file != new.file){cambiar.nombre.pdf<-1}
  }
##+ =============================
#) change the name of the output pdf file
#1) leido por sistema
        if (cambiar.nombre.pdf==1)
        {
          system(paste(path,'mv',' ',base.file,'.pdf ',new.file,'.pdf', sep=''),intern=silent)
        }                
#2) change the name of the output pdf file si el usuario da nombre
        if (!is.na(outname))
        {
        #filename.old<-filename; filename<-outname    
          system(paste(path,'mv',' ',filename,'.pdf ',outname,'.pdf', sep=''),intern=silent)
        }        
    
        if (preview)
        {
                system(paste(options('pdfviewer')[[1]],' ',filename,'.pdf',sep=''))
#                system(paste(options('xpdf')[[1]],' ',filename,'.pdf',sep=''))
        }
#message("Hola loco")        
message("Did you change name of the output pdf file?",cambiar.nombre.pdf)
}
