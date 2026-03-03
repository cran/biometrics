#! @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# Function: "comparCorreFunc"                                                     #
# This function compare models [fitted using either gls() or lme()]               #
#  using different spatial correlation functions with and without nugget effects. #
# The main ouput is the model as an object                                        #
#                                                                                 #
# How this function works?:                                                       #
# The syntax is:>  comparCorreFunc(mod.obj,the.data,range.corre,lme.or.no)        #
# Where:                                                                          #
# - mod.obj: is either a fitted model using gls() or lme()                        # 
# - the data: is the dataframe used for fitting the object models                 #
# - range.corre: is the range (in the same units that the spatial coordinates
#       units) used for computing the spatial correlation                         #
# - lme.or.no: 1 if the object model was fitted with lme(), or 0 for gls()        #
#                                                                                 #
# Author: Christian E. Salas Eljatib                                              #
# Date: Mar 31, 2009                                                              #
# New Haven, CT, USA                                                              #
#! @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#comparCorreFunc <- function(mod.obj,the.data,range.corre,lme.or.no){
comparCorreFunc <- function(mod.obj,the.data,lme.or.no){  
if(lme.or.no==1){prefijo.mod=c('lme')} else {prefijo.mod=c('gls')}

type.spat.correfx <- c("exponential","gaussian","linear","ratio","spherical")
#type.spat.correfx <- c("exponential","gaussian","linear")
type.nugget <- c(FALSE,TRUE)
type.met <- c('euclidean','maximum','manhattan')
#"euclidean"  "maximum" for the maximum difference; and "manhattan

n.type.spat.correfx <- length(type.spat.correfx)
n.type.nugget <- length(type.nugget)
n.type.met <- length(type.met)

aic.out=c()
name.model.out=c()
corfx.out=c(); nugg.out=c(); met.out=c()
counter=0; counter.out=c()

for(i in 1:n.type.spat.correfx){
  
  for(j in 1:n.type.nugget) {

# if(j==1){nugget.si=c('NuggetYes')} else {nugget.si=c('NuggetNo')}
 if(j==1){nugget.si=c('with')} else {nugget.si=c('without')}    
   for(z in 1:n.type.met) {
my.corspat <- nlme::corSpatial(#range.corre,
         form= ~ x + y, type= type.spat.correfx[i], nugget=type.nugget[j],
          met=type.met[z])
my.corspat.run <-  nlme::Initialize(my.corspat, the.data[,c('x','y')])


new.model <- try(stats::update(mod.obj,
         corr = my.corspat.run),silent=TRUE)

#name.model=paste(prefijo.mod,'.Cor',type.spat.correfx[i], nugget.si,sep='')
name.model=paste(prefijo.mod,'.Cor_',type.spat.correfx[i], '.',nugget.si,'Nugget','.Met_',type.met[z],sep='')

#getting the AIC for this model
if(length(new.model)>1){aic.run=stats::AIC(new.model)} else {aic.run=10000000}
if(length(new.model)<1){new.model=0} else {nada=1}
 
aic.out=c(aic.out,aic.run)
name.model.out=c(name.model.out,name.model)
 corfx.out=c(corfx.out,i)
 nugg.out=c(nugg.out,j)
 met.out=c(met.out,z)
counter=counter+1
counter.out=c(counter.out,counter)
}
}
}

#paso.aic=data.frame(corfx.out,nugg.out,name.model.out,aic.out)
paso.aic=data.frame(corfx.out,nugg.out,met.out,name.model.out,aic.out)
paso.aic
or<-order(paso.aic$aic.out,decreasing=F)
paso.2<-paso.aic[or,]
paso.2
selec.mod.name=paso.2$name.model.out[1]
selec.mod.name
selec.corfx=as.numeric(paso.2$corfx.out[1])
selec.corfx
selec.nugg=as.numeric(paso.2$nugg.out[1])
selec.nugg
selec.met=as.numeric(paso.2$met.out[1])
selec.met
#anova(lme.p,lme.p2,lme.p3)

# fit AGAIN only the best model
my.corspat <- nlme::corSpatial(#range.corre,
   form= ~ x + y, type= type.spat.correfx[selec.corfx], nugget=type.nugget[selec.nugg],
                         metric=type.met[selec.met])
my.corspat.run <-  nlme::Initialize(my.corspat, the.data[,c('x','y')])

new.model <- stats::update(mod.obj, corr = my.corspat.run)

final.mod <- new.model
attr(final.mod,"best.model") <- selec.mod.name
#output=list(c(final.mod,selec.mod.name))
#cat('the best model is ', attr(final.mod,"best.model"), sep='', '\n')
output=final.mod
output
#ls()
} 
#corMatrix(best.gls)
#getVarCov(best.gls)
# End of "comparCorreFunc"
#! @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
