#' Crecimiento en diámetro y altura de árboles muestra de Grand-fir.
#'
#' @description
#' Crecimiento en diámetro y altura de 66 árboles de Grand-fir. Los
#' datos fueron derivados a partir de árboles muestras de análisis
#' fustal colectados por el Dr. Albert Stage (US Forest Service,
#' Moscow, ID, USA.)
#'
#' @usage
#' data(treegrowth)
#' @format Contiene las siguientes siete columnas:
#' \describe{
#'   \item{num.arb}{Número identificador del árbol. Único para cada árbol muestra.}
#'   \item{bosque}{Tipo forestal.}
#'   \item{habitat}{Clasificacion de tipo de hábitat.}
#'   \item{cod.arb}{Un código que combina a las siguientes
#'    columnas: `num.arb-bosque-habitat`}
#'   \item{edad}{Edad, en años.}
#'   \item{dap}{Diámetro a la altura del pecho, en cm. Originalmente
#'   fue medido en pulgadas, y acá se transformó empleando un solo decimal.}
#'   \item{atot}{Altura total, in m. Originalmente esta variable fue 
#'   medido en pies, y acá se transformó empleando un solo decimal.}
#'  }
#' @source
#' En un principio los datos fueron cedidos por el Dr. Albert Stage
#' (Q.E.P.D) al Profesor Andrew Robinson (University of Idaho, USA),
#' quien los usaba para explicar el ajuste de modelos estadísticos. El
#' Dr. Christian Salas-Eljatib fue un estudiante de postgrado en
#' estadistica del Prof. Robinson en la Univ. of Idaho.
#'
#' @references
#' - Stage, A. R., 1963. A mathematical approach to polymorphic site index
#'  curves for Grand fir. Forest Science 9 (2), 167–180.
#' @examples
#' data(treegrowth2)
#' df<-treegrowth2
#' head(df)
#' require(lattice)
#' xyplot(dap~edad, groups = cod.arb,data=df, type="b")
'treegrowth2'
