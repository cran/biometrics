#' Densidad media en distintos tratamientos de raleo en *Drymis winteri*
#' de Chile.
#'
#' @description
#' Densidad media por tratamiento de raleo en renovales de *Drymis winteri*
#' en el sector de Hueicolla, Cordillera de la Costa de Valdivia (Chile).
#' Los datos corresponden al período 1986-1990 e incluyen diferentes intensidades
#' de raleo (2 m, 3 m, 4 m, raleo de liberación y testigo sin intervención).
#' Se presentan valores medios de densidad (N°/ha) con su desviación estándar,
#' además de la mortalidad promedio anual y su tasa porcentual.
#'
#' @usage
#' data(densidadcanelo2)
#'
#' @format
#' Los datos contienen las siguientes columnas:
#' \describe{
#'   \item{tratamiento}{Distancia o tipo de raleo aplicado (2m, 3m, 4m, raleo, testigo)}
#'   \item{anho.eval}{Año de evaluación (1986 o 1990)}
#'   \item{nha}{Densidad promedio en número de individuos por hectárea (N°/ha)}
#'   \item{nha.sd}{Desviación estándar asociada a la densidad}
#' }
#'
#' @source
#' Datos tomados de: Navarro et al. (1997), Efectos del raleo en renovales de *Drymis winteri*,
#' Hueicolla, Cordillera de la Costa de Valdivia, Chile.
#'
#' @references
#' Navarro, C., Donoso, P., y Rosas, M. (1997). Crecimiento de renovales
#' de *Drymis winteri* sometidos a distintos tratamientos de raleo.
#' En: Donoso, C. (Ed.), Bosques templados de Chile y Argentina.
#' Editorial Universitaria, Santiago de Chile.
#'
#' @examples
#' data(densidadcanelo2)
#' head(densidadcanelo2)
#' plot(densidadcanelo2$anho.eval, densidadcanelo2$nha, col="forestgreen", pch=19,
#'      main="Densidad por año de evaluación",
#'      xlab="Año", ylab="N° árboles/ha")
"densidadcanelo2"
