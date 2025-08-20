#' Mortality of lianas (vines) in tropical forests
#'
#' @description
#' This study is part of the project "Diversity and dynamics of vascular
#'  epiphytes in Colombian Andes"
#' supported by `COLCIENCIAS` (contract 2115-2013). The data corresponds to
#'  the first large-scale
#' assessment of vascular epiphyte mortality in the neotropics. Based on two
#' consecutive annual surveys,
#' we followed the fate of 4247 epiphytes to estimate the epiphyte mortality
#' rate on 116 host trees
#' at nine sites. Additional variables were taken from the area of study in
#' order to find relationships
#' with epiphyte mortality.
#' @usage
#' data(deadlianas)
#' @format The data frame contains four variables as follows:
#' \describe{
#' \item{PlotSite}{Municipality name of the 9 study sites}
#' \item{Y.Plot}{Latitude of the plot in decimal degrees}
#' \item{X.Plot}{Longitude of the plot in decimal degrees}
#' \item{PhoroNo}{ID number of the sampled host trees in each site}
#' \item{EpiFam}{Epiphyte taxonomic family}
#' \item{EpiGen}{Epiphyte taxonomic genus}
#' \item{cf.aff}{Abbreviations of Latin terms in the context of taxonomy. cf.
#'  "confer" meaning "compare with". aff.: "affinis" meaning "similar to".}
#' \item{Species}{Epiphyte (morpho) species name}
#' \item{Author}{Author of the scientific name}
#' \item{EpiAzi}{Azimuth of the epiphyte individual on each host tree}
#' \item{BraAzi}{Azimuth of the branch in which the epiphyte individual was
#' found}
#' \item{EpiDisTru}{Distance in meters from the trunk to the epiphyte
#' attachment site on a branch}
#' \item{EpiSize}{Estimated size of the epiphyte individual, in cm.}
#' \item{EpiAttHei}{Epiphyte attachment height in meters}
#' \item{Date0}{Date of the first census}
#' \item{Date1}{Date of the final census}
#' \item{Location}{Section (roots, trunks, branches) of the host tree in
#' which theepiphyte individual was found}
#' \item{Mortality}{Dichotomous variable. 0 if the epiphyte individual was
#'  dead in the final census and 1 if otherwise}
#' \item{MorCat}{Mechanical or non-mechanical cause of mortality}
#' \item{Elevation}{Elevation (m a.s.l.) of the plot}
#' \item{AP_bio12}{Annual precipitation in the plot (mm yr-1)}
#' \item{PDM_bio14}{Precipitation of driest month in the plot (mm)}
#' \item{PS_bio15}{Precipitation seasonality in the plot (coefficient of
#' variation)}
#' \item{MDT_bio2}{Mean Diurnal Range (Mean of monthly (max temp - min temp))
#'  in the plot (oC * 10)}
#' \item{TS_bio4}{Temperature seasonality in the plot (standard
#' deviation * 100)}
#' \item{ATR_bio7}{Annual temperature range in the plot (10 celsius degrees)}
#' \item{AET}{Actual evapotranspiration in the plot (mm yr-1)}
#' \item{BasAre}{Basal area of trees with DBH major or equal to 5 cm (AB) in
#'  the plot (m\eqn{^{2}}{^2}/ha)}
#' \item{BasAre5_10}{Basal area of trees with greater or equal than 5  DBH and
#'  less than 10 cm in the plot (m\eqn{^{2}}{^2}/ha)}
#' \item{BasAre10}{Basal area of trees with greater or equal than 10 cm DBH in
#'  the plot (m\eqn{^{2}}{^2}/ha)}
#' \item{Ind10}{Number of canopy trees (with greater or equal than 10 cm DBH )
#'  in the plot}
#' \item{Ind5}{Number of understory trees (with greater or equal than 5 DBH and
#'   less than 10 cm) in the plot}
#' \item{Ind5_10}{Number of trees with greater or equal than 5  DBH and
#' less than 10 cm in the plot}
#' \item{Ind10_15}{Number of trees with greater or equal than 10  DBH and
#' less than 15 cm in the plot}
#' \item{Ind15_20}{Number of trees with greater or equal than 15  DBH and
#' less than 20 cm in the plot}
#' \item{Ind20_25}{Number of trees with greater or equal than 20  DBH and
#' less than 25 cm in the plot}
#' \item{Ind25_30}{Number of trees with greater or equal than 25  DBH and less
#' than 30 cm in the plot}
#' \item{Ind30}{Number of trees with DBH major or equal to 30 cm in the plot}
#' \item{TreeHei}{Total tree height in meters}
#' \item{MedHei}{Median height of trees in each plot}
#' \item{MaxHei}{Maximum height of trees in each plot}
#' \item{BranchNumb}{Number of branches of the host tree}
#' \item{Obs}{Observations and notes in Spanish}
#'  }
#' @source
#' Data were retrieved from the DRYAD repository at \doi{10.5061/dryad.g5510}.
#' @references
#' Zuleta D, Benavides AM, Lopez-Rios V, Duque A. 2016. Local and regional
#' determinants
#' of vascular epiphyte mortality in the Andean mountains of Colombia.
#' Journal of Ecology 104(3): 841-843. \doi{10.1111/1365-2745.12563}
#' @examples
#' data(deadlianas)
#' head(deadlianas)
'deadlianas'
