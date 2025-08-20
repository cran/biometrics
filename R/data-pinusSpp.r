#' Tree-level variables of several sample plots of invasive Pinus spp in Chile
#' @description
#' These are tree-lavel measurement data from Pinus spp invasion in
#' _Araucaria-Nothofagus_ forests in the Malalcahuello National Reserve in
#'  La Araucanía region in southhern Chile, measured in 2012.
#' There are 26 plots and plot size is 100 m².
#' @usage
#' data(pinusSpp)
#' @format Contains eight variables, as follows:
#' \describe{
#' \item{plot.id}{Plot sample ID.}
#' \item{plot.size}{Plot size, en m\eqn{^{2}}{^2}.}
#' \item{lat.s}{Decimal coordinate of S latitude.}
#' \item{long.w}{Decimal coordinate of W longitude.}
#' \item{indv.id}{Tree identificator number in each plot. Same `indv.id` for
#' multi-stem trees.}
#' \item{stem.id}{Stem identificator number in each plot.}
#' \item{spp}{Species.}
#' \item{dbh}{Diameter at breast-height, in cm.}
#' \item{toth}{Total height, in m.}
#' \item{hcb}{Height to crown base, in m.}
#' \item{crown.lenght}{Crown lenght, in m.}
#' }
#' @source
#'  The data is provided courtesy of Drs. Aníbal Pauchard and Rafael García at
#'   the Laboratorio de Invasiones
#'  Biológicas, Universidad de Concepción (Concepción, Chile).
#' @references
#'  - Cobar-Carranza A, Garcia R, Pauchard A, Pena E. 2014. Effect of
#'  _Pinus contorta_ invasion on forest fuel properties and
#'  its potential implications on the fire regime of _Araucaria araucana_ and
#'  _Nothofagus antarctica_ forests. Biological Invasions. 16(11): 2273-2291.
#'  \doi{10.1007/s10530-014-0663-8}
#
#' @examples
#' data(pinusSpp)
#' head(pinusSpp)
#' length(unique(pinusSpp$plot.id))
#' boxplot(dbh~plot.id, data=pinusSpp)
'pinusSpp'
