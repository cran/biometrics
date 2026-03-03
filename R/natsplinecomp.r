# The follofing functions are defined for allometric-modeling purposes
# Transformation for natural spline regression
# Eq 2.25 in Harrells book, p. 20
# t is a vector of knots, j the component to be calculated
natural.spline.comp<-function(X,t,j){
   k<-length(t)
   pmax(0,X-t[j])^3-pmax(0,X-t[k-1])^3*(t[k]-t[j])/(t[k]-t[k-1])+
   pmax(0,X-t[k])^3*(t[k-1]-t[j])/(t[k]-t[k-1])
}
