#' Smoothed tree list data from permanent sample plots
#'
#' @description
#' Temporal tree-level variables (smoothed-values) within four sample plots
#'  in an experimental forest in Austria. The dataframe contains all
#' the variables for all trees, where observation gaps were
#'  filled from monotone increasing predictive functions.
#'  Plot sizes are 2500 m\eqn{^{2}}{^2} (approx.) and the current dataframe
#'  only keeps the measurement years having a more reliable amount of records.
#' @usage
#' data(trlsmoopsp)
#' @format Contains tree-level variables, as follows:
#' \describe{
#'   \item{plot}{Plot number.}
#'   \item{tree}{Tree identificator.}
#'   \item{year}{Year of measurement.}
#'   \item{species}{Species code as follows:
#'   PCAB=_Picea abies_, LADC=_Larix decidua_, PNSY=_Pinus sylvestris_,
#'   FASY=_Fagus Sylvatica_, QCPE=_Quercus petraea_, BTPE=_Betula pendula_.}
#'   \item{obs}{Observation in this year.}
#'  \item{dbh}{Diameter at breast-height, in cm.}
#'  \item{toth}{Tree height, in m.}
#'  \item{hcb}{Height to the crown base, in m.}
#'  }
#' @source
#' The Austrian Research Center for Forests established a spacing experiment
#'  with Norway spruce (_Picea abies_) in the Vienna Woods. In the ``Hauersteig''
#'  experiment, several tree-level variables were measured within four sample
#'  plots over time. Data were retrieved from the paper cited below, where several details
#' might be worth reading.
#' @references
#' - Kindermann G. Kristofel F, Neumann M, Rossler G, Ledermann T &
#' Schueler. 2018. 109 years  of forest growth measurements from
#' individual Norway spruce trees. Sci. Data 5:180077
#' \doi{10.1038/sdata.2018.77}
#' 
#' @examples
#' data(trlsmoopsp)
#' df<-trlsmoopsp
#' head(df)
#' table(df$year,df$plot)
#' tapply(df$dbh, list(df$year,df$plot), length)
'trlsmoopsp'
