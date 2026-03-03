sweavetexOrga <- function(fileNameS,extension='Rnw',command='pdflatex',
                          silent=FALSE,preview=FALSE)
{
#-------------------------------------------------------------------------------
#
#  A nice little routine to run any Sweave script that is stored
#  in the './SweaveTeXBib' directory of the current Rwork directory.
#
#  Arguments...
#    fileName = an rnw file name in the /Rwork/SweaveTexBib directory
#
#  Returns...
#    pdflatex command invisibly
#
#   J. H. Gove			jhgove@unh.edu         June 2005
#   USDA Forest Service
#   Northern Research Station
#   271 Mast Road
#   Durham, NH 03824		(603) 868-7667
# modified by   
#   C. Salas	christian.salas@yale.edu         dec02, 2009
#  Last changes: jul21, 2010
#  temuco, chile
#-------------------------------------------------------------------------------
#
sw.dir<-NULL
sweaveset() ##!now is a function
sw.dirh<-getwd() ##>asume lo corremos desde donde esta el Sweave file
    
        if (command=='latex') command='simpdftex latex --maxpfb'
        extension<-paste('.',extension,sep='')
        path=options('latexcmd')[[1]]
        path=substr(path,start=1,stop=nchar(path)-5)
  
##! 1. generate the .tex file with Sweave from R...
#
###  cur.dir = getwd()
### where is the main .Rnw file?   
###  sw.dir = paste(getwd(), '/SweaveLaTeXBib/', sep='')
## # Sweave(file.path(sw.dir, fileName))
##        Sweave(file.path(sw.dir, paste(fileNameS,extension,sep='') ))
 Sweave(file.path(sw.dirh, paste(fileNameS, extension, sep = "")))    

cat('~~~~~~~ \n')          
cat('Running BibTeX \n')
cat('~~~~~~~ \n')    
#
##! 2. run BibTeX...
#
  fn = unlist(strsplit(fileNameS, "\\."))[1]
  cat('\nRunning BibTeX...\n')
#changes here        
#  fPath = file.path( getwd(), paste(fn, '.tex', sep='') )
#  system(paste('mv', fPath, file.path( sw.dir, paste(fn, '.tex', sep='') ) ) )
#    setwd(sw.dir) ##> quizas no es necesario
    setwd(sw.dirh) ##> quizas no es necesario
  fPath <- file.path( getwd(), paste(fn, '', sep='') )
#  j = system(paste('pdflatex ', fPath), intern=T)
  system(paste('bibtex ', fPath), intern=F)

  
cat('~~~~~~ \n')          
cat('Running pdfLaTeX \n')
cat('~~~~~~ \n')    
#
##1 3. run pdfLaTeX...
#
  fn <- unlist(strsplit(fileNameS, "\\."))[1]
  cat('\nRunning pdfLaTeX...\n')
#  fPath = file.path( getwd(), paste(fn, '.tex', sep='') )
#  system(paste('mv', fPath, file.path( sw.dir, paste(fn, '.tex', sep='') ) ) )
#  setwd(sw.dir)
  fPath <- file.path( getwd(), paste(fn, '.tex', sep='') )
#  j = system(paste('pdflatex ', fPath), intern=T)
  system(paste('pdflatex ', fPath), intern=F)
#       system(paste(path,command,' ',fPathS,sep=''),intern=silent)

  
cat('~~~~~ ')      
cat('Cleaning a little bit the folder where you are working')
cat('~~~~~ \n')    
##! 4. clean up...
#
  fPath <- file.path( getwd(), paste(fn, '.log', sep='') )
  dum <- system(paste('rm ', fPath), intern=F)
#  setwd(cur.dir) #come back to the original working folder
# ojo, quizas podria cambiarlo a "cur.dirb", as givin in myweavesettings.R
#  return(invisible(j))
}
