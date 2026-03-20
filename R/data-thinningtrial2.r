#' Variables de estado segun tratamiento de raleo en renovales de _Drymis winteri_
#' en Valdivia, Chile.
#'
#' @description
#' Valores medios de variables de estado de rodal en un ensayo de raleo
#' de renovales de _Drymis winteri_ en Hueicolla, en la Cordillera de
#' la costa de Valdivia (Chile). Las mediciones se realizaron los
#' años 1986 y 1990. Los tratamientos de raleo son:
#' distanciamiento entre árboles de 2 m, 3 m, y 4 m; raleo de liberación, 
#' y testigo (i.e., sin intervención).
#' Los valores son la media de las siguientes variables de rodal: densidad
#' (arb/ha), area basal (\eqn{^{2}}{^2}/ha) y volumen (\eqn{^{3}}{^3}/ha).
#'
#' @usage
#' data(thinningtrial2)
#'
#' @format
#' Los datos contienen las siguientes columnas:
#' \describe{
#'   \item{trat}{Tratamiento de raleo: distanciamiento a 2m, 3m, y
#' 4m; raleo de liberación; y testigo.}
#'   \item{tiempo}{Año de evaluación (1986 o 1990)}
#'   \item{nha}{Densidad media, en arb/ha.}
#'   \item{gha}{Área basal media, en m\eqn{^{2}}{^2}/ha}
#'   \item{vha}{Volumen medio, en m\eqn{^{3}}{^3}/ha.}
#' }
#'
#' @source
#' Datos digitados desde los cuadro 4, 6 y 7 de Navarro et al. (1997).
#'
#' @references
#' Navarro, C., Donoso, P., y Rosas, M. (1997). Crecimiento de renovales
#' de *Drymis winteri* sometidos a distintos tratamientos de raleo.
#' En: Donoso, C. (Ed.), Bosques templados de Chile y Argentina.
#' Editorial Universitaria, Santiago de Chile.
#'
#' @examples
#' data(thinningtrial2)
#' head(thinningtrial2)
#' df<-thinningtrial2
#' require(lattice)
#' xyplot(nha~tiempo|trat, data=df, type="b",as.table=TRUE)
#' xyplot(nha~tiempo,groups=trat, data=df, type="b",auto.key = TRUE)
#' xyplot(gha~tiempo|trat, data=df, type="b",as.table=TRUE)
"thinningtrial2"
