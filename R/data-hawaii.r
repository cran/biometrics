#' Diameter growth increments of a tropical tree species in Hawaii
#' @description
#' Tree size, competition, and diameter growth increment of
#'  _Metrosideros polymorpha_ trees collected in the Kilauea Volcano, Hawaii.
#' Data containing 64 observations at the current annual growth
#' rate (defined as `dbh` increment within one calendar year) of each tree.
#'  Measurements were made from 1986 to 1988.
#' @usage
#' data(hawaii)
#' @format The dataframe has the following columns:
#' \describe{
#'   \item{tree.code}{Tree number identification. The first letter of the
#'   ID represents a cohort. Six cohorts representing a chronosequence
#'   were sampled.}
#'   \item{dbh}{Diameter at breast height, in cm.}
#'   \item{toth}{Total height, in m.}
#'   \item{crown.area}{Crown outline area, in square meters.}
#'   \item{comp.ind}{Competition index (Basal area of nearest neighbor
#'   divided by square of distance to nearest neighbor plus
#'          basal area of second nearest neighbor divided by square of
#'          distance to second nearest neighbor).}
#'   \item{cai.1986}{Current annual stem diameter increment during 1986, in mm.}
#'   \item{cai.1987}{Current annual stem diameter increment during 1987, in mm.}
#'   \item{cai.1988}{Current annual stem diameter increment during 1988, in mm.}
#'  }
#' @source
#' The data were obtained from Gerrish and Mueller-Dombois (1999).
#' @references
#'-  Gerrish G, Mueller-Dombois D. 1999. Measuring stem growth rates for
#' determining age and cohort analysis of a tropical evergreen tree.
#' Pacific Science. 53(4): 418-429.
#' @examples
#' data(hawaii)
#' head(hawaii)
'hawaii'
