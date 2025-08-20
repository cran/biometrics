#' Mortalidad en bosques, y variables climáticas y de estructura
#' forestal en California (USA)
#'
#' @description
#' El archivo de datos contiene una fila por combinación única de celda
#' de cuadrícula de 3,5 km por año.
#' El marco de datos cubre todas las celdas de la cuadrícula dentro del
#' estado de California donde se
#' tomo al menos un vuelo de la Encuesta de deteccion aérea (ADS) entre
#' 2009 y 2015, por lo que cada posición
#' de celda de la cuadrícula tiene entre 1 y 7 años de datos (reflejados
#' como 1 a 7 filas en el archivo de datos
#' por posición de celda de cuadrícula). Las principales variables de
#' respuesta son `mort.bin` (presencia de alguna mortalidad)
#'  y `mort.tph` (número de árboles muertos /ha dentro de la celda de la
#'   cuadrícula por año).
#' @usage
#' data(mortaforest2)
#' @format Las variables se describen a continuación::
#' \describe{
#' \item{live.bah}{Área basal viva del conjunto de datos GNN}
#' \item{live.tph}{Árboles vivos por hectárea del conjunto de datos GNN}
#' \item{pos.x}{Posición `X` del orden de clasificación de la celda de la
#'  cuadrícula (la posición `1` es la más occidental)}
#' \item{pos.y}{Posición `Y` del orden de clasificación de la celda de la
#'  cuadrícula (la posición `1` es la más al norte)}
#' \item{alb.x}{Coordenada `X` del centroide de la celda de la cuadrícula
#' en California Albers (EPSG 3310)}
#' \item{alb.y}{Coordenada `Y` del centroide de la celda de la cuadrícula
#' en California Albers (EPSG 3310)}
#' \item{mort.bin}{Codificación para identificar mortalidad. `1` = árboles
#' muertos observados en la celda de la cuadrícula. `0` = no se observaron
#'  árboles muertos}
#' \item{mort.tph}{Árboles muertos por hectárea del conjunto de datos
#'  ADS agregado}
#' \item{mort.tpa}{Árboles muertos por acre del conjunto de datos
#' ADS agregado}
#' \item{year}{año del vuelo de ADS. La mayoría de los vuelos se realizaron
#' entre mayo y agosto}
#' \item{Defnorm}{Déficit hídrico climático anual medio para la celda de
#'  la cuadrícula, para el año hídrico del 1 de octubre al 31 de septiembre,
#'   promediado de 1981 a 2015}
#' \item{Def0}{Déficit de agua climática para la celda de la cuadrícula
#' durante el año hidrológico de octubre a septiembre que se superpone al
#'  vuelo ADS de verano del año dado}
#' \item{Defz0}{Puntaje Z para el déficit hídrico climático para la celda
#'  de cuadrícula / año hídrico dado. Calculado como (`Def0`--`Defnorm`) /
#'  (desviación estándar en el déficit entre todos los años 1981-2015 para
#'   la celda de la cuadrícula dada)}
#' \item{Defz1}{Puntuación Z para el déficit hídrico climático para la
#' celda de la cuadrícula dada en el año hidrológico anterior.}
#' \item{Defz2}{Puntuación Z para el déficit hídrico climático para la
#' celda de la cuadrícula dada dos años antes.}
#' \item{Tz0}{Puntaje Z para la temperatura para la celda de
#' cuadrícula / año dado.}
#' \item{Pz0}{Puntaje Z para la precipitación para la celda / año de la
#' cuadrícula dado.}
#' \item{Defquant}{Variable FDCI. Cuantil de `Defnorm` de la celda de la
#'  cuadrícula dada, en relación con la `Defnorm` de todas las demás celdas de
#'   la cuadrícula con un área basal dentro de 2.5 m\eqn{^{2}}{^2}/ha de
#'   la celda dada}
#'  }
#' @source
#' Los datos fueron obtenidos desde el repositorio
#'  DRYAD en \doi{10.5061/dryad.7vt36}
#' @references
#' - Young DJN, Stevens JS, Earles JM, Moore J, Ellis A, Jirka AM, LatimerML. 2017. Long-term climate and competition explain forest mortality patterns under extreme drought. Ecology Letters 20(1):78-86. \doi{10.1111/ele.12711}
#' 
#' - Salas-Eljatib C, Fuentes-Ramírez A, Gregoire TG, Altamirano A,
#' and Yaitul V. 2018. A study on the effects of unbalanced data when
#'  fitting logistic regression models in ecology.
#'  Ecological Indicators 85:502-508. \doi{10.1016/j.ecolind.2017.10.030}
#' @examples
#' data(mortaforest2)
#' head(mortaforest2)
'mortaforest2'
