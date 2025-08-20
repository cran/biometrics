#' Extract the n-th element from a list
#'
#'
#'
#' @title Extract the n-th element from a list
#' @param lst is the list object
#' @param n is the position of the element in the list to be retrieved
#'
#' @return object with elements of each list
#'
#' @author Christian Salas-Eljatib
#' @examples
#' x <- list(list("z","x","y"), list(3,4,99,23,45), list(1,67,5,6,89))
#' nele.list(x,1)
#' nele.list(x,2)
#' nele.list(x,3)
#'
#' @rdname nele.list
#' @export
#'
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
nele.list <- function(lst, n){
  sapply(lst, `[`, n)
}
