#' Tree locations within sample plots in an experimental forest in Austria
#'
#' @description
#' The Austrian Research Center for Forests established a spacing experiment
#'  with Norway spruce (_Picea abies_) in the Vienna Woods. In the ``Hauersteig''
#'  experiment, several tree-level variables were measured within four sample
#'  plots over time. **The current dataframe has only the measurements
#'   carried out in 1944**, for all years see `biometrics::spatimepsp`.
#' @usage
#' data(spataustria)
#' @format Contains cartesian position of trees, and covariates,
#' in sample plots, as follows:
#' \describe{
#' \item{plot}{Plot number.}
#'   \item{tree}{Tree number.}
#'   \item{species}{Species code as follows:
#'   PCAB=_Picea abies_, LADC=_Larix decidua_, PNSY=_Pinus sylvestris_,
#'   FASY=_Fagus Sylvatica_, QCPE=_Quercus petraea_, BTPE=_Betula pendula_.}
#' \item{x.coord}{Cartesian position in the X-axis, in m.}
#' \item{y.coord}{Cartesian position in the Y-axis, in m.}
#' \item{year}{Measurement year.}
#' \item{dbh}{Diameter at breast-height, in cm.}
#'  }
#' @source
#' Data were retrieved from the paper cited below, where several details
#' might be worth reading. For instance, plot size slightly varies among plots:
#'  Plot No. 1=2509.7 m\eqn{^{2}}{^2}, Plot No. 2=2474.8 m\eqn{^{2}}{^2},
#'  Plot No. 3=2415.9 m\eqn{^{2}}{^2}, and Plot No. 4=2482.8 m\eqn{^{2}}{^2}.
#' @references
#' - Kindermann G. Kristofel F, Neumann M, Rossler G, Ledermann T &
#' Schueler. 2018. 109 years  of forest growth measurements from
#' individual Norway spruce trees. Sci. Data 5:180077
#' \doi{10.1038/sdata.2018.77}
#' 
#' @examples
#' data(spataustria)
#' head(spataustria)
#' df<-spataustria
#' oldpar<-par(mar=c(4,4,0,0))
#' bord<-data.frame(
#'  x=c(min(df$x.coord),max(df$x.coord),min(df$x.coord),max(df$x.coord)),
#'  y=c(min(df$y.coord),min(df$y.coord),max(df$y.coord),min(df$y.coord))
#'  )
#' plot(bord,type="n", xlab="x (m)", ylab="y (m)", asp=1, bty='n')
#' points(df$x.coord,df$y.coord,col=df$plot,cex=0.5)
#' par(oldpar)
'spataustria'
