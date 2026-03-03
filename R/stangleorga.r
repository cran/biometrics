stangleOrga <- function(fileName,extension='Rnw',command='pdflatex',silent=FALSE,preview=FALSE)
{
#-------------------------------------------------------------------------------
#
#  A nice little routine to obtain an .R file (with only the R codes) from
#   a .Rwn file (i.e., a Sweave file) that is located
#   in the './SweaveTeXBib' directory of the current Rwork directory.
#
#  Arguments...
#    fileName = an rnw file name in the /Rwork/Sweave directory
#
#   Christian Salas	christian.salas@yale.edu         Mar 15, 2009  
#-------------------------------------------------------------------------------
#
sw.dir<-NULL;out.dir.f<-NULL;cur.dir<-getwd();
sweaveset() ##now is a function
    sw.dirh<-getwd() ##>asume lo corremos desde donde esta el Sweave file
    
        if (command=='latex') command='simpdftex latex --maxpfb'
        extension<-paste('.',extension,sep='')
        path=options('latexcmd')[[1]]
        path=substr(path,start=1,stop=nchar(path)-5)

  
##1. generate the .R file from Sweave from R...
#  fn = unlist(strsplit(filename, "\\."))[1]  
  cat('\nRunning Stangle()...\n')  

##  cur.dir = getwd()
## where is the main .Rnw file?   
##  sw.dir = paste(getwd(), '/SweaveLaTeXBib/', sep='')
##  Sweave(file.path(sw.dir, fileName))
##        Sweave(file.path(sw.dir, paste(fileName,extension,sep='') ))

#    Stangle(file.path(sw.dir, paste(fileName,extension,sep='') ))
Stangle(file.path(sw.dirh, paste(fileName,extension,sep='') ))
    
cat('\nMoving the .R file to the /rwork/outs subfolder \n')
#      fPathtex = file.path( getwd(), paste(fn, '.R', sep='') )
      fPathtex <- file.path( cur.dir, paste(fileName, '.R', sep='') )
#    system(paste('mv ', fPathtex, file.path( sw.dir ) ) )
                                        #     #    system(paste('mv ', fPathtex, file.path( out.dir ) ) )
##> ojo no tiene que ser con doble //    
    system(paste('mv ', fPathtex, file.path( "../outs" ) ) )
#    system(paste('mv ', fPathtex, out.dir.f ) )
    
cat('~~~~~ ')      
cat('The process is done!, you have an .R file')
cat('~~~~~ \n')    
## clean up...
#
  setwd(cur.dir) #come back to the original working folder
#  return(invisible(j))
}
