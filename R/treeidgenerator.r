treeIdGenerator <- function(data, tree.id.anho = TRUE,
                            tree.id.latex = TRUE) {
    db <- data
    if (is.null(db$plot.id)) {
        stop("Los datos no tiene la columna plot.id, proceso no pudo completarse")
    }
    ## tiene cuadrante
    db$tree.id[!is.na(db$cuadrante)] <-  paste(db$plot.id[!is.na(db$cuadrante)],
                                               db$cuadrante[!is.na(db$cuadrante)], sep = "_q")
    ## no tiene cuadrante
    db$tree.id[is.na(db$cuadrante)] <-  paste(db$plot.id[is.na(db$cuadrante)],
                                              "999", sep = "_q")
    ## agrega arbol
    db$tree.id <- paste(db$tree.id, db$narb, sep = "_t")
    if (tree.id.anho == TRUE) {
        ## tree.id.anho
        db$tree.id.anho <- paste(db$tree.id,
                                 db$anho.med,
                                 sep = "_")
    }
    if (tree.id.latex == TRUE) {
        ## tree.id.latex
        db$tree.id.latex <- gsub(x = db$tree.id,
                                 pattern = "_",
                                 replacement = "\\_",
                                 fixed = TRUE)
    }
    if (tree.id.anho * tree.id.latex == TRUE) {
        ## tree.id.anho.latex
        db$tree.id.anho.latex <- gsub(x = db$tree.id.anho,
                                      pattern = "_",
                                      replacement = "\\_",
                                      fixed = TRUE)
    }
    db
}
