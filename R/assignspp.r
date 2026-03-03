#' Assign species botanical information to a data frame
#'
#' @description Assigns species botanical attributes to a dataset,
#' based upon a reference column (`refcol`). The attributes can be
#' any of the fields available in the [biometrics::spplist] dataframe,
#' such as: `spp.ci.name` (genus and epitetus name of the species),
#' `spp.name` (common name), and `spp.ci.abb`
#' (abbreviated scientific name).
#'
#' @param data A dataframe where to assign the species information.
#'
#' @param attri A string vector having the attributes of the species
#' to be assigned from the species list contained in [biometrics::spplist].
#' This vector, by default, has two attributes: `spp.name` and
#' `spp.ci.name`, representing the common name and the scientific
#' name, respectively. Other alternatives are, among others,
#' `spp.ci.abb` (abbreviated scientific name), `genus` (genus of the
#' species), and `family` (family of the species).
#'
#' @param refcol A string having the common column name to be used for
#' linking both the dataset and the species list. In
#' [biometrics::spplist], all the attributes available for the species
#' list are detailed, showing all the information that can be joined
#' to the dataset. Notice that the `refcol` has to exist in both the
#' dataset and the species list. Additional options of the
#' [base::merge()] function can be passed to the current `assignspp()`
#' function.
#' 
#' @param attri.all By default is set to `FALSE`, otherwise, will
#' overwrite the vector provided in option `attri`, with all the
#' attributes available in the species list.
#' 
#' @param all.x Whether to preserve not finded values (`TRUE`,
#' default) or not (`FALSE`).
#'
#' @param ... Other options for controlling the [base::merge()]
#' function, which is internally loaded.
#'
#' @seealso [biometrics::spplist] and [base::merge()].
#'
#' @returns A dataframe object including the attributes defined in
#' the parameter `attri`.
#' 
#' @examples
#' ## example data frame
#' myData <- data.frame(narb = c(1, 2, 3),
#'                      sppcode = c("nob", "np", "nd"),
#'                      dbh = c(20, 14, 23))
#' myData
#' 
#' 
#' ## assign common, scientific and abbreviated name, based on `esp` value (default)
#' assignspp(myData)
#' 
#' ## Assign more than one attribute based on common name
#' ## just to remember, adding a single attribute (different from the default)
#' assignspp(myData, attri = "spp.ci.name")
#' ## now, a more real example
#' newData <- assignspp(myData, attri = c("spp.name","genus","spp.ci.abb"))
#' newData 
#' ## by default this function preserve names not found in biometrics::spplist
#' missingData <- rbind(myData, c(4, "notFoundData", 30))
#' missingData
#' assignspp(missingData, attri = "spp.name")
#' ##the latter can be modified with option `all.x` of the `merge()` function
#' assignspp(missingData, attri = "spp.name", all.x = FALSE)
#' ## In the case of wanting all the attributes to be merged, set option
#' ## `attri.all` to `TRUE`, which willl overwrite the vector `attri`.
#' assignspp(missingData, attri = "spp.name", attri.all=TRUE, all.x =
#' FALSE)
#' 
#' @rdname assignspp
#' @export
#' 
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
assignspp <- function(data,
                      attri = c("spp.name", "spp.ci.name"),
             refcol = "sppcode", all.x = TRUE, attri.all=FALSE,...){
 all.attr.list<-names(biometrics::spplist)   
 colorder<-names(data);data$id.corre<-1:nrow(data);ncol.ori<-ncol(data)
 tomerge <- c(refcol, as.vector(attri))
 if(attri.all==TRUE){tomerge<-all.attr.list}
    out<-merge(data, biometrics::spplist[, tomerge], by = refcol,
               all.x = all.x, ...)
    newcols <- names(out[!(names(out) %in% colorder)])
    out<-out[c(colorder,newcols)];
    out<-out[order(out$id.corre), ]
    out[,-ncol.ori]
}
