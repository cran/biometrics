#' Contains coarse woody debris measurement in a unit of
#' line intersect sampling.
#'
#' @description
#' These are log-level variables measured in the field in a single
#' line intersect sampling (LIS) unit. The length of the
#' line or transect is 30 m. Details on this type of
#' sampling strategy can be reviewed in Gregoire and Valentine (2008).
#'
#' @format Data contains the following columns:
#' \describe{
#'   \item{element}{Element (i.e., log) number with the LIS sample.}
#'   \item{diam}{Diameter of the element, in cm.}
#'   \item{len}{Length, in m.}
#'   \item{ang}{Angle of the element with respect to the line
#' sampling, in degrees.}
#'  }
#' @source
#' Data from Marshall et al 2000.
#'
#' @references
#' - Marshall PL, G Davis, VM LeMay. 2000. Using line intersect
#' sampling for coarse woody debris. Technical Report 3,
#' British Columbia Forest Service, Nanaimo, BC, Canada. 34 p.
#' - Gregoire TG, HT Valentine. 2008. Sampling Strategies for Natural
#' Resources and the Environment. New York, USA.
#' Chapman & Hall/CRC. 474 p.
#'
#' @examples
#' data(cwd)
#' cwd
'cwd'
