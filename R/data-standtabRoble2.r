#' Tabla de rodal media para renovales de  _Nothofagus obliqua_
#' (roble)
#'
#' @description
#' Tabla de rodal media para renovales dominados por
#' _Nothofagus obliqua_ (roble), que tienen entre 40 y 50 años,
#' en las provincias de Malleco, Cautín, y Valdiva, en el sur de
#' Chile.
#' @usage
#' data(standtabRoble2)
#' @format Las columnas son las siguientes
#' \describe{
#' \item{cd}{Clase diamétrica, en cm.}
#' \item{nha}{Densidad para la respectiva clase diamétrica,
#' en arb/ha.}
#'  }
#' @source
#' La tabla de rodal proviene de Puente et al. (1979), y es el
#' resultado de un estudio sobre los bosques secundarios de
#' _Nothofagus_ en el sur de Chile.
#' @references
#' - Puente M, C Donoso, R Peñaloza, E Morales. 1979. Estudio de
#' raleo y otras técnicas para el manejo de renovales de
#' raulí (_Nothofagus alpina_) y roble (_Nothofagus obliqua_).
#' Etapa I: Identificación y caracterización de renovales de raulí
#' y roble. Informe de convenio No. 5, Proyecto
#' CONAF/PNUD/FAO-CHI/76/003, Santiago, Chile. 88 p.
#' @examples
#' data(standtabRoble2)
#' df<-standtabRoble2
#' df<-df[-nrow(df),]
#' # Grafico de distribucion diametrica 
#' barplot(df$nha, legend = TRUE, beside = TRUE, las=1,
#'         names.arg = df$cd,
#'         ylab="Densidad (arb/ha)",xlab="Clase diametrica (cm)")
#' abline(h=0)
"standtabRoble2"
