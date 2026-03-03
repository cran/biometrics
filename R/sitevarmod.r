#!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# Function: "sitevarmod"                                        #
# This function fit the Stage and Salas (2007, Forest Science) model              #
# How this function works?:                                                       #
# The syntax is:>  sitevarmod(data.touse,respvarY)                           #
# Where:                                                                          #
# - I assume all the variables have been correctly named                          #
#                                                                                 #
# Author: Christian E. Salas Eljatib                                              #
# Date: Mar 04, 2009                                                              #
# New Haven, CT, USA                                                              #
#-----------------------------                                                    #
sitevarmod <- function(data,respvar="y",factvar="factvar",ele="elevation",
          slo="slope",asp="aspect"){
  df<-data
  df$ele <- df[, ele];df$slo <- df[, slo];df$asp <- df[, asp];    
  col.h<-datana::findColumn.byname(data=df,col.name = respvar)
  name.respvar<-names(df)[col.h];name.respvar  
  col.h<-datana::findColumn.byname(data=df,col.name = factvar)
  name.factvar<-names(df)[col.h];name.factvar
  df[,factvar]<-factor(df[,factvar])
  code <- paste0("stats::lm(", name.respvar, " ~ ",name.factvar, "+ ele + I(ele^2)+ 
      slo + I(slo*cos(asp*(pi/180))) +  I(slo*sin(asp*(pi/180))) +
      I(slo*log(ele)) + I(slo*log(ele)*cos(asp*(pi/180))) + 
      I(slo*log(ele)*sin(asp*(pi/180))) + I(slo*ele^2) + 
      I(slo*ele^2*cos(asp*(pi/180)))+ I(slo*ele^2*sin(asp*(pi/180))),
      data=df)")
  eval(parse(text=code))
}
#! @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# set.seed(1234); n<-100
# faclevels<-c("hab.typeDF","hab.typeGF","hab.typePP")
# df <- data.frame(sindex=rnorm(n, mean=30,3), slope=rexp(n,rate=0.9),
#   altitude=rnorm(n,mean=1300,sd=150),aspect=runif(n,0,360),
#   habitat=sample(faclevels,n,replace = T))
# head(df)
# unique(df$habitat)
# table(df$habitat)
# library(datana)
# descstat(df[,1:(ncol(df)-1)])
# 
# m1<-sitevarmod(data=df,respvar="sindex",factvar="habitat",ele="altitude",
#                 slo="slope",asp="aspect")
# summary(m1)

