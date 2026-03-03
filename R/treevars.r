treevars <- function(data) {
    unique(data[, sapply(data, function(col) length(unique(col)) == 1)])
}
