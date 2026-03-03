#' @title Function that fits a list of models on a given dataframe.
#'
#' @param modlist List that contains the models to be fitted.
#' To know the structure, see examples below.
#' @param data `dataframe` that contains the values that correspond to
#' observed values and variables as columns.
#' @param file  a (writable binary-mode) connection or the name of the
#' file where the data will be saved (when tilde expansion is done).
#' @param file.full wheter to include all output (`TRUE`) or
#' just the fitted models plus their respective `pred.f` field
#' (`FALSE`, default).
#' @param trace logical value indicating if a trace of the iteration
#' progress of [stats::nls()] should be printed (`TRUE`) or not
#' (`FALSE`, default).
#' @param ... Other options used to control de behavior of
#' [stats::nls()].
#'
#' @examples
## list of example models
#' model.list <- list(
#'     mod1 = list(expr = vtot ~ I(dap^2) + I(dap^2 * atot^2) +I(d6),
#'                 pred.f = function(x, ...) x,
#'                 type = "lm"),
#'     mod2 = list(expr = I(log(vtot)) ~ I(log(dap)) + I(log(atot)),
#'                 pred.f = function(x, ...) exp(x),
#'                 type = "lm"))
#' 
#' ## example dataframe
#' df <- treevolruca2
#' head(df)
#' 
#' ## fitting models to dataframe
#' bankfit(modlist = model.list, data = df)
#' 
#' @rdname bankfit
#' @export
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
bankfit <- function(modlist, data, file = NULL, file.full = FALSE,
                    trace = FALSE, ...) {
    bankfit.out <- lapply(names(modlist), function(x) {
        mod.type <- modlist[[x]][["type"]]
        pred.f <- modlist[[x]][["pred.f"]]
        ## fitting process, either lm() or nls() with trycatch
        ## indicating non fitted model. In case of an already fitted
        ## model, just save the expresion for posterior prediction
        if (mod.type == "lm") {
            mod <- lm(modlist[[x]][["expr"]], data = data)
            summodel <- datana::modresults(mod)
        } else if (mod.type == "fitted") {
            mod <- modlist[[x]][["expr"]]
            summodel <- NULL
        } else if (mod.type == "nls") {
            mod <-tryCatch(expr = {
                nls(modlist[[x]][["expr"]],
                    data = data,
                    start = modlist[[x]][["start.vals"]],
                    trace = trace)},
                error = function(e) {
                    modelE <- x
                    messageE <- paste0("\033[33mError processing model\033[0m \033[31m<",
                                       modelE,
                                       ">\033[0m \n \033[34mMessage:\033[0m ",
                                       e$message)
                    warning(messageE)
                    return(NA)
                })
            summodel <- NULL
            print(mod)
        }
        list(mod = mod, summ = summodel, data = data,
             pred.f = pred.f, type = mod.type)
    })
    names(bankfit.out) <- names(modlist)
    ## Cleaning non convergent models
    bankfit.out <- Filter(function(x) {
        all(!is.na(x[["mod"]]))
    }, bankfit.out)
    ## saving the object if asked for
    if (!is.null(file)) {
        if (file.full == FALSE) {
            bankfit.out <- lapply(bankfit.out, function(x) {
                x["data"] <- NULL
                x["summ"] <- NULL
                return(x)
            })
            save(bankfit.out, file = file)
        }
        if (file.full == TRUE) {
            save(bankfit.out, file = file)
        }
    }
    return(bankfit.out)
}
