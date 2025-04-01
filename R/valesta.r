#' Computes three prediction statistics as a way to compare observed
#'  versus predicted values of a response variable of interest. The statistics are: 
#'  the aggregated difference (\eqn{AD}),
#'   the root mean square differences (\eqn{RMSD}), and
#'    the aggregated of the absolute value differences (\eqn{AAD}).
#'  All of them area based on 
#' \deqn{r_i = y_i - \hat{y}_i}
#' where \eqn{y_i} and \eqn{\hat{y}_i} are the observed and the 
#' predicted value of the response variable \eqn{y} for 
#' the i-th observation, respectively. Both the observed and predicted values 
#' must be expressed in the same units. 
#'  
#' @details The function computes the three aforementioned statistics
#'  expressed in (i) as the units of the response variable and (i) as 
#'  a percentage. Notice that to represent each statistic in percentual 
#'  terms, we divided them by the mean observed value of the response variable.
#' 
#' @title Function to compute prediction statistics based on observed values 
#' @param y.pred predicted values of the variable of interest
#' @param y.obs observed values of the variable of interest 
#'
#' @return The main output  following six prediction statistics as a vector: 
#' (RMSD, RMSD.p, AD, AD.p, AAD, AAD.p); where RMSD.p stands for RMSD 
#' expressed as a percentage, and the same applies to AD.p and AAD.p.
#'  
#' @author Christian Salas-Eljatib.
#' @references
#' - Salas C, Ene L, Gregoire TG, Nasset E, Gobakken T. 2010. Modelling tree diameter
#'  from airborne laser scanning derived variables: a comparison of spatial statistical
#'  models. Remote Sensing of Environment 114(6):1277-1285. \doi{10.1016/j.rse.2010.01.020}
#'  
#' - Salas C. 2002. Ajuste y validación de ecuaciones de volumen para un 
#' relicto del bosque de roble-laurel-lingue. 
#' Bosque 23(2):81–92. \doi{10.4067/S0717-92002002000200009}. 
#' 
#' @examples
#'
#' #Creates a fake dataframe
#' set.seed(1234)
#' df <- as.data.frame(cbind(Y=rnorm(30, 30,9), X=rnorm(30, 450,133)))
#' #fitting a candidate model
#' mod1 <- lm(Y~X, data=df)
#' #Using the valesta function
#' valesta(y.obs=df$Y,y.pred=fitted(mod1))
#' @rdname valesta
#' @export
#' 
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
valesta <- function(y.obs=y.obs,y.pred=y.pred){
  n=length(y.pred)
  res.y=y.obs-y.pred
  res.y.2=(y.obs-y.pred)^2
  rmsd=sqrt( sum(res.y.2)/n ) #root mean square differences 
  rmsd.p=(rmsd/(mean(y.obs)))*100
  RMSD=c(rmsd,rmsd.p)
  ad=sum(res.y)/n #aggregated difference (AD) or mean residual
  ad.p=(ad/(mean(y.obs)))*100
  AD=c(ad,ad.p)
  aad=sum(abs(res.y))/n #aggregated of the absolute value differences 
  aad.p=(aad/(mean(y.obs)))*100
  AAD=c(aad,aad.p)
  output=c(AD,RMSD,AAD)
  names(output)=c('AD','AD.p','RMSD','RMSD.p','AAD','AAD.p')
  output}   