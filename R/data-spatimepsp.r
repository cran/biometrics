#' Temporal tree locations within a sample plot in the Vienna woods
#'
#' @description
#' The Austrian Research Center for Forests established a spacing experiment
#'  with Norway spruce (_Picea abies_) in the Vienna Woods. In the ``Hauersteig''
#'  experiment, several tree-level variables were measured within four sample
#'  plots over time.
#' 
#' @usage
#' data(spatimepsp)
#' @format Contains cartesian position of trees, and covariates,
#' in a sample plot, as follows:
#' \describe{
#' \item{plot}{Plot number.}
#'   \item{tree}{Tree number.}
#'   \item{species}{Species code as follows:
#'   PCAB=_Picea abies_, LADC=_Larix decidua_, PNSY=_Pinus sylvestris_,
#'   FASY=_Fagus Sylvatica_, QCPE=_Quercus petraea_, BTPE=_Betula pendula_.}
#' \item{x.coord}{Cartesian position in the X-axis, in m.}
#' \item{y.coord}{Cartesian position in the Y-axis, in m.}
#' \item{year}{Measurement year.}
#' \item{dbh}{diameter at breast-height, in cm.}
#'  }
#' @source
#' Data were retrieved from the paper cited below, where several details
#' might be worth reading.
#' @references
#' - Kindermann G. Kristofel F, Neumann M, Rossler G, Ledermann T &
#' Schueler. 2018. 109 years of forest growth measurements from
#' individual Norway spruce trees. Sci. Data 5:180077
#' \doi{10.1038/sdata.2018.77}
#' 
#' @examples
#' data(spatimepsp)
#' head(spatimepsp)
#' df<-spatimepsp
#' lattice::xyplot(y.coord~x.coord|as.factor(year),
#' data=df,as.table=TRUE)
'spatimepsp'
