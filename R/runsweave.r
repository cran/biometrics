runSweave <- function(fileName='chapter1.rnw')
{
#-------------------------------------------------------------------------------
#
#  A nice little routine to run any Sweave script that is stored
#  in the ./Sweave directory of the current Rwork directory.
#
#  Arguments...
#    fileName = an rnw file name in the /Rwork/Sweave directory
#
#  Returns...
#    pdflatex command invisibly
#
#   J. H. Gove			jhgove@unh.edu         June 2005
#   USDA Forest Service
#   Northern Research Station
#   271 Mast Road
    ##   Durham, NH 03824		(603) 868-7667
##! not too-much tested    
#-------------------------------------------------------------------------------
#
# generate the tex file with Sweave...
#
    cur.dir <- getwd()
    sw.dir<-NULL
sweaveset() ##now is a function    
#  sw.dir = paste(getwd(), '/Sweave/', sep='')
sw.dir <- paste(getwd(), '', sep='')  #<--- I added this
  Sweave(file.path(sw.dir, fileName))

#
# run pdfLaTeX...
#
  fn <- unlist(strsplit(fileName, "\\."))[1]
  cat('\nRunning pdfLaTeX...\n')
  fPath <- file.path( getwd(), paste(fn, '.tex', sep='') )
  system(paste('mv', fPath, file.path( sw.dir, paste(fn, '.tex', sep='') ) ) )
  setwd(sw.dir)
  fPath <- file.path( getwd(), paste(fn, '.tex', sep='') )
  j <- system(paste('pdflatex ', fPath), intern=T)

#
# clean up...
#
  fPath <- file.path( getwd(), paste(fn, '.log', sep='') )
  dum <- system(paste('rm ', fPath), intern=T)
  setwd(cur.dir)
  return(invisible(j))
}
