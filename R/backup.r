backup <- function(file = stop("you must provide a file"), copy = TRUE) {
    tiempo.actual <- format(Sys.time(), "%Y%m%d%H%M%S")
    archivo <- file
    archivolimpio <- gsub("./", "", archivo)
    os <- Sys.info()["sysname"] ## se ejecuta distinto dependiendo del sistema operativo
    if (file.exists(archivo)) {
        if (os == "Linux") {
            comando <- ifelse(copy, "cp", "mv")
            system(paste(comando, archivo, paste0("./", tiempo.actual, "-", archivolimpio, ".bak")))
        }
        if (os == "Windows") {
            comando <- ifelse(copy, "copy", "move")
            system(paste(comando, archivo, paste0("./", tiempo.actual, "-", archivolimpio, ".bak")))
        }
    }

}
