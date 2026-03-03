#! cubic spline regression suggested by Harrell's boook with 3 knots
splinereg<-function(x,y){
       t<-quantile(x,tau=c(0.10,0.5,90),na.rm=TRUE)
       x_2<-natural.spline.comp(x,t,1)
       beta<-coef(lm(y~x+x_2),na.action=na.omit)
       x2<-seq(min(na.omit(x)),max(na.omit(x)),length=100)       
       y<-beta[1]+beta[2]*x2+beta[3]*natural.spline.comp(x2,t,1)
       list(x=x2,y=y)       
}
