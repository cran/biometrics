plotIdGenerator <- function(data, plot.id.anho = TRUE,
                            plot.id.latex = TRUE) {
    db <- data
    message("Start of: assignment of plot id")
    ## creando plot.id, siempre tiene proyecto y predio
    db$plot.id <- paste(db$proy.id, db$predio, sep = "_")
    ## agregar rodal, en el caso de no tener agregar 999
    db$plot.id[is.na(db$rodal)] <- paste(db$plot.id[is.na(db$rodal)], "r999", sep = "_")
    db$plot.id[!is.na(db$rodal)] <- paste(db$plot.id[!is.na(db$rodal)],
                                          db$rodal[!is.na(db$rodal)], sep = "_r")
    ## agregar conglomerado, en el caso de no tener agregar 999
    db$plot.id[is.na(db$conglomerado)] <- paste(db$plot.id[is.na(db$conglomerado)], "c999", sep = "_")
    db$plot.id[!is.na(db$conglomerado)] <- paste(db$plot.id[!is.na(db$conglomerado)],
                                                 db$conglomerado[!is.na(db$conglomerado)], sep = "_c")
    ## agregar parcela
    db$plot.id <- paste(db$plot.id, db$parc, sep = "_p")
    unique(db$plot.id)
    ## ejemplo de plot.id 10_casasViejas_r999_c999_p201
    if (plot.id.anho == TRUE) {
        ## crea plot.id.anho
        db$plot.id.anho <- paste(db$plot.id, db$anho.med, sep = "_")
    }
    if (plot.id.latex == TRUE) {
        ## crea plot.id.latex y plot.id.anho.latex
        db$plot.id.latex <- gsub(x = db$plot.id,
                                 pattern = "_",
                                 replacement = "\\_",
                                 fixed = TRUE)
        unique(db$plot.id.latex)
    }
    if (plot.id.anho * plot.id.latex == TRUE) {
        db$plot.id.anho.latex <- gsub(x = db$plot.id.anho,
                                      pattern = "_",
                                      replacement = "\\_", fixed = TRUE)
    }
    db
}
