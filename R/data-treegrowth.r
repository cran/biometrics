#' Diameter and height growth of Grand-fir sample trees.
#'
#' @description
#' Diameter and height growth of 66 Grand-fir trees. Data derived from
#' stem analysis sample trees collected by Dr. Albert Stage (US Forest
#' Service, Moscow, ID, USA.)
#'
#' @usage
#' data(treegrowth)
#' @format Contains seven column, as follows:
#' \describe{
#'   \item{tree.no}{Tree number identificator. An unique number 
#'   to each sample tree.}
#'   \item{forest}{Forest type.}
#'   \item{habitat}{Forest habitat type.}
#'   \item{tree.code}{A composite tree code representing the following
#'    columns: `tree.id-forest-habitat`}
#'   \item{age}{Age, in yr}
#'   \item{dbh}{Diameter at breast-height, in cm. Originally measured in
#'    inches, and was converted to cm using a single decimal.}
#'   \item{toth}{Total height, in m. Originally measured in feet, and was 
#'   converted to m using a single decimal.}
#'  }
#'
#' @source
#' Originally, the data were provided by Dr. Albert Stage (R.I.P) to
#' Professor Andrew Robinson (University of Idaho, USA), whom used
#' them to explain the fitting of statistical models. Dr Christian
#' Salas-Eljatib was a former graduate student of Statistics of Prof.
#' Robinson at the Univ. of Idaho.
#'
#' @references
#' - Stage, A. R., 1963. A mathematical approach to polymorphic site index
#'  curves for Grand fir. Forest Science 9 (2), 167–180.
#' @examples
#' data(treegrowth)
#' df<-treegrowth
#' head(df)
#' require(lattice)
#' xyplot(dbh~age, groups = tree.code,data=df, type="b")
'treegrowth'
