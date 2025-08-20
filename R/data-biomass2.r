#' Biomasa a nivel de árbol para cuatro especies arbóreas de Canadá
#'
#' @description
#' Biomasa a nivel de árbol y otras variables, para cuatro
#' especies que crecen en bosques de Canadá.
#'
#' @format Los datos contienen las siguientes columnas:
#' \describe{
#'   \item{arbol}{Número del árbol.}
#'   \item{spp}{Nombre común de la especie, como sigue: `Balsam fir` es 
#'   _Abies balsamea_, `Black spruce` es _Picea mariana_, 
#'   `White birch` es _Betula papyrifera_, y `White spruce`
#'    es _Picea glauca_.}
#'   \item{dap}{Diámetro a la altura del pecho (1.3 m), en cm.}
#'   \item{atot}{Altura total, en m.}
#'   \item{wtot}{Biomasa total, en kg.}
#'   \item{wfus}{Biomasa del fuste, en kg.}
#'   \item{wramas}{Biomasa de las ramas, en kg.}
#'   \item{whojas}{Biomasa del follaje, en kg.}
#'  }
#' @source
#' Los datos fueron cedidos cortesía del profesor Timothy Gregoire,
#' School of Forestry and Environmental Studies, Yale University (New
#' Haven, CT, USA).
#'
#' @examples
#' data(biomass2)
#' head(biomass2)
#' tapply(biomass2$wtot,biomass2$spp,summary)
'biomass2'
