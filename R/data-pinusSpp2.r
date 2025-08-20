#' Variables a nivel de árbol en parcelas de muestreo de Pinus spp en Chile.
#' @description
#' Mediciones a nivel de árbol para estudiar la invasión de Pinus spp en
#' bosques de _Araucaria-Nothofagus_ en
#' la Reserva Nacional Malalcahuello en la región de la Araucanía en el sur de
#' Chile.
#' Hay 26 parcelas, y la superficie de cada una es de 100 m\eqn{^{2}}{^2}.
#' @usage
#' data(pinusSpp2)
#' @format Los datos contienen ocho columnas que se detallan a continuación:
#' \describe{
#' \item{parcela}{Número de la parcela.}
#' \item{sup.parcela}{Superficie de la parcela, en m\eqn{^{2}}{^2}.}
#' \item{lat.s}{Coordenada decimal latitud S.}
#' \item{long.w}{Coordenada decimal longitud W.}
#' \item{indv.id}{Identificador del árbol en la parcela. Mismo `indv.id`
#' para árboles multi-fustales}
#' \item{fuste.id}{Identificador del fuste.}
#' \item{espe}{Especie.}
#' \item{dap}{Diámetro a la altura del pecho, en cm.}
#' \item{atot}{Altura total, en m.}
#' \item{hcc}{Altura comienzo de copa, en m.}
#' \item{largo.copa}{Largo de copa, en m.}
#' }
#' @source
#'  Los datos fueron cedidos por los Drs. Aníbal Pauchard y Rafael García del
#'  Laboratorio de Invasiones
#'  Biológicas, Universidad de Concepción (Concepción, Chile).
#' @references
#'  - Cobar-Carranza A, Garcia R, Pauchard A & Pena E. 2014. Effect of
#'   Pinus contorta invasion on forest fuel properties and
#'   its potential implications on the fire regime of *Araucaria araucana*
#'   and Nothofagus antarctica forests. Biological Invasions. 16(11):2273-2291.
#'   \doi{10.1007/s10530-014-0663-8}
#
#' @examples
#' data(pinusSpp2)
#' head(pinusSpp2)
#' length(unique(pinusSpp2$parce))
#' boxplot(dap~parce, data=pinusSpp2)
'pinusSpp2'
