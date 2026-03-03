#' The function predicts the variable of biometrics-interest for each
#' model belonging to the list previously fitted, as well as,
#' generates a dataframe with the results.
#'
#' @title Predicts the variable of interest for each model of the list
#' 
#' @param file The output from [biometrics::bankfit()] as a file path
#' or object.
#' @param data A dataframe for the prediction of the response
#' variable's values using the models fitted in `file`.
#' @examples
#' \dontrun{
#' ## list of example models
#' model.list <- list(
#'     mod1 = list(expr = vtot ~ I(dap^2) + I(dap^2 * atot^2) +I(d6),
#'                 pred.f = function(x, ...) x,
#'                 summodel = function(x, ...) datana::modresults(x)),
#'     mod2 = list(expr = I(log(vtot)) ~ I(log(dap)) + I(log(atot)),
#'                 pred.f = function(x, ...) exp(x),
#'                 summodel = function(x, ...) datana::modresults(x)))
#' 
#' ## example dataframe
#' df <- treevolruca2
#' head(df)
#' 
#' ## fitting models to dataframe and saving them
#' bankfit(models = model.list, data = df, file = "out.rdata")
#' 
#' 
#' ## using fitted models file from biometrics::bankfit()
#' bankpred(file = "out.rdata", data = df) 
#' }
#' @rdname bankpred
#' @export
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
bankpred <- function (file = stop("You must provide a bankfit output object"),
                      data = stop("You must provide a dataframe")) {
    if (exists(deparse(substitute(file)))) {
        bankfit.out <- file
    } else {
        load(file)
    }
    bankpred.out <- lapply(names(bankfit.out), function(x) {
        mod <- bankfit.out[[x]]$mod
        pred.f <- bankfit.out[[x]]$pred.f
        model.type <- bankfit.out[[x]]$type
        df <- data
        yhat <- tryCatch(if (model.type %in% c("lm", "nls")) {
            predict(mod, data)
        }
        else if (model.type == "fitted") {
            eval(mod)
        }, error = function(e) NA)
        ypred <- tryCatch(pred.f(yhat, df), error = function(e) NA)
        data.frame(y.hat = yhat, y.pred = ypred, model = x)
    })
    return(do.call(rbind, bankpred.out))
}
