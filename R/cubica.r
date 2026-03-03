#' Compute taper volume
#'
#' @description Performs the cubication of taper data. If the data
#' corresponds to a full tree, and `pred == FALSE` the calculation is
#' performed as a cilinder for the stump, smalian for each section in
#' the stem and a cone for the crown. Otherwise, just smalian is used
#' and a sum is performed up to the corresponding heights.
#'
#' @param dl `vector` of diameters. Has to have the same length as `hl`
#' @param hl `vector` of heights. Has to have the same length as `dl`
#' @param hstump a numeric value indicating the stump height. If
#' missing and `pred == FALSE` it defaults to the height of the first
#' section.
#' @param htop a numeric value indicating the height to crown base. If
#' missing and `pred == FALSE` it defaults to the height of the next
#' to last section.
#' @param dlu numeric values indicating comercial diameters. If the
#' values doesn't exists in the data they are interpolated via
#' datana::interp.
#' @param hlu numeric values indicating comercial heights. If the
#' values doesn't exists in the data they are interpolated via
#' datana::interp.
#' @param full.tree wheter the data comes from a full tree having
#' stump, stemp and crown (`TRUE`, default) or just stem data
#' (`FALSE`).
#' @param pred wheter the data comes from measured data (`FALSE`,
#' default) or from predicted values (`TRUE`).
#' @param rel.vol numerical values of relative volumes, used to
#' compute the corresponding height and diameter.
#' @param ... optional parameters to pass to [datana::interp()].
#'
#' @returns A list with data.frames with the different volumes
#' calculated.
#'
#' @author Christian Salas-Eljatib and Nicolás Campos
#'
#' @examples
#' \dontrun{
#' ## generating suitable data
#' df <- data.frame(dl = c(31.1, 25.8, 21.2, 19.6, 17.9, 15.9, 13.5,  9.8,  7.3, 0),
#'                  hl = c(0.30, 0.80, 1.30, 4.88, 9.76, 12.20, 14.64, 19.52, 24.40, 31.1),
#'                  hstump = c(0.30, 0.30, 0.30, 0.30, 0.30, 0.30, 0.30, 0.30, 0.30, 0.30),
#'                  htop = c(24.40, 24.40, 24.40, 24.40, 24.40, 24.40, 24.40, 24.40, 24.40, 24.40))
#' df
#' 
#' cubica(dl = df$dl,
#'        hl = df$hl,
#'        hstump = unique(df$hstump),
#'        htop = unique(df$htop))
#' 
#' ## adding commercial volumes
#' cubica(dl = df$dl,
#'        hl = df$hl,
#'        dlu = c(20, 15, 21.2),
#'        hstump = unique(df$hstump),
#'        htop = unique(df$htop))
#' }
#' @rdname cubica
#' @export
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
cubica <- function(dl, hl,
                   hstump = NA, htop = NA,
                   dlu = NA, hlu = NA,
                   full.tree = TRUE, pred = FALSE,
                   rel.vol = c(25, 30, 40, 50, 90), ...) {

    ## generate temp dataframe
    df.hori <- data.frame(dl = dl, hl = hl)
    df.h <- na.omit(df.hori)
    df.h <- df.h[order(df.h$hl), ]

    ## interpolate values for dl and/or hl
    interpolated.vals <- data.frame(matrix(ncol = 0, nrow = 1))
    if (!all(is.na(dlu)) || !all(is.na(hlu))) {
        ## only interpolate missing values
        filtered.dlu <- NA
        filtered.hlu <- NA
        if (any(dlu %in% dl)) {
            filtered.dlu <- dlu[which(!(dlu %in% dl))]
            if (length(filtered.dlu) == 0) {
                filtered.dlu <- NA
            }
        } else {
            filtered.dlu <- dlu
        }
        if (any(hlu %in% hl)) {
            filtered.hlu <- hlu[which(!(hlu %in% hl))]
            if (length(filtered.hlu) == 0) {
                filtered.hlu <- NA
            }
        } else {
            filtered.hlu <- hlu
        }
        if (!all(is.na(filtered.dlu)) || !all(is.na(filtered.hlu))) {
            interp.h <- datana::interp(x = df.h$dl, y = df.h$hl,
                                       xlu = filtered.dlu,
                                       ylu = filtered.hlu,
                                       completename.x = "dlu",
                                       completename.y = "hlu",
                                       ...)

            df.h <- interp.h$datares.full
            names(df.h) <- gsub("x", "dl", names(df.h))
            names(df.h) <- gsub("y", "hl", names(df.h))
            newsections <- interp.h$intvalues
            names(newsections) <- c("dl", "hl")
            interpolated.vals <- interp.h$completevals
            names(interpolated.vals) <- gsub("x", "dl", names(interpolated.vals))
            names(interpolated.vals) <- gsub("y", "hl", names(interpolated.vals))
        }
    }

    if (full.tree) {
        ## If the tree is 'fake' (predicted values along fake series of
        ## heights) ##################################################
        if (pred) {
            ## All volumes are calculated via smalian
            vsec <- c()
            for (i in 1:(nrow(df.h))){
                if (i == 1) {
                    v.h <- 0
                } else {
                    v.h <- biometrics::volume(d = c(df.h$dl[i], df.h$dl[i - 1]),
                                              h = c(df.h$hl[i], df.h$hl[i - 1]))
                }
                vsec <- c(vsec, v.h)
            }

            ## stump
            if (is.na(hstump)) {
                stop("You must provide stump height")
            } else if (is.numeric(hstump)) {
                stump.sec <- which(df.h$hl == hstump)
                vstump <- sum(vsec[1:stump.sec])
            } else {
                stop("Wrong hstump")
            }

            ## crown
            if (is.na(htop)) {
                stop("You must provide height to crown base")
            } else if (is.numeric(htop)) {
                crown.sec <- which(df.h$hl == htop)
                vtop <- sum(vsec[crown.sec:nrow(df.h)])

            } else {
                stop("Wrong htop")
            }

            ## stem
            vfust <-  sum(vsec[(stump.sec + 1):(crown.sec - 1)])

            v <- vsec

        } else if (!pred) {
            ## If the tree is 'real' (measured values) ###############

            ## stump
            if (is.na(hstump)) {
                stump.sec <- 1
            } else if (is.numeric(hstump)) {
                if (hstump %in% df.h$hl) {
                    stump.sec <- which(df.h$hl == hstump)
                } else {
                    stop("hstump not found in data")
                }
            } else {
                stop("Wrong hstump")
            }

            ## volume as cilinder
            vstump <- biometrics::volume(form = "cilinder",
                                         d = df.h$dl[stump.sec],
                                         l = df.h$hl[stump.sec])

            ## crown
            if (is.na(htop)) {
                crown.sec <- nrow(df.h) - 1
            } else if (is.numeric(htop)) {
                if (htop %in% df.h$hl) {
                    crown.sec <- which(df.h$hl == htop)
                } else {
                    stop("htop not found in data")
                }
            } else {
                stop("Wrong htop")
            }
            dtop <- df.h$dl[crown.sec]
            ltop <- max(df.h$hl) - df.h$hl[crown.sec]

            ## volume as cone
            vtop <- biometrics::volume(form = "cone",
                                       d = dtop,
                                       l = ltop)

            ## middle volume as the sum of each section volume
            vsec <- c()
            for (i in (stump.sec + 1):crown.sec){
                v.h <- biometrics::volume(d = c(df.h$dl[i], df.h$dl[i - 1]),
                                          h = c(df.h$hl[i], df.h$hl[i - 1]))
                vsec <- c(vsec, v.h)
            }
            vfust <- sum(vsec)
            v <- c(vstump, vsec, vtop)
            vtotal <- vstump + vfust + vtop
            vacc <- cumsum(v)
            vrel <- vacc / vtotal
            vrel.p <- vrel * 100
        }
        ##- values returned ##########################################
        ## resumed data
        resdata <- data.frame(vtoc = vstump,
                              vfust  = vfust,
                              vcopa   = vtop,
                              vtot = vtotal)

        ## all data, with corresponding volumes
        alldata <- cbind(df.h, v, vacc, vrel, vrel.p, resdata)

        ## comercial volumes
        cvol <-  data.frame(matrix(ncol = 0, nrow = 1))
        if (!all(is.na(dlu))) {
            for (i in dlu[order(dlu, decreasing = TRUE)]) {
                sufix.h <- i
                cname.h <- paste("vdu", sufix.h, sep = ".")
                vdf <- subset(alldata, dl >= i)$v
                cvol[cname.h] <- sum(vdf)
            }
        }
        if (!all(is.na(hlu))) {
            for (i in hlu[order(hlu, decreasing = FALSE)]) {
                sufix.h <- i
                cname.h <- paste("vhu", sufix.h, sep = ".")
                vdf <- subset(alldata, hl <= i)$v
                cvol[cname.h] <- sum(vdf)
            }
        }
        ## append completevals to datares
        datares.full <- cbind(alldata, cvol)

        ## heights and diameters of relative volumes
        heights.all <- suppressWarnings({datana::interp(x = alldata$hl,
                                                        y = alldata$vrel.p,
                                                        ylu = rel.vol,
                                                        completename.x = "h_v",
                                                        method = "linear")})
        heights <- heights.all$completevals
        names(heights) <- gsub("\\.","",names(heights))

        diameters.all <- datana::interp(x = alldata$dl,
                                        y = alldata$vrel.p,
                                        ylu = rel.vol,
                                        completename.x = "dl_v",
                                        method = "linear")
        diameters <- diameters.all$completevals
        names(diameters) <- gsub("\\.","",names(diameters))
        rhd <- intercala.c(diameters, heights)
        ## append rel.vol.data to datares
        datares.full <- cbind(alldata, cvol, rhd)
        
        ## output of function ###########################################
        return(list(volumes = resdata,
                    datares = alldata,
                    merchv = cvol,
                    completevals = interpolated.vals,
                    rel.vol.data = rhd,
                    datares.full = datares.full))
    } else if (!full.tree) {
        message("assuming all data belongs to stem")
        vsec <- c()
        for (i in 1:(nrow(df.h))){
            if (i == 1) {
                v.h <- 0
            } else {
                v.h <- biometrics::volume(d = c(df.h$dl[i], df.h$dl[i - 1]),
                                          h = c(df.h$hl[i], df.h$hl[i - 1]))
            }
            vsec <- c(vsec, v.h)
        }
        v <- vsec
        vfust <- sum(vsec)
        vacc <- cumsum(v)
        vrel <- vacc / vfust
        vrel.p <- vrel * 100

        ##- values returned ##########################################
        ## resumed data
        resdata <- data.frame(vfust  = vfust,
                              vtot = vfust)

        ## all data, with corresponding volumes
        alldata <- cbind(df.h, v, vacc, vrel, vrel.p, resdata)

        ## comercial volumes
        cvol <-  data.frame(matrix(ncol = 0, nrow = 1))
        if (!all(is.na(dlu))) {
            for (i in dlu[order(dlu, decreasing = TRUE)]) {
                sufix.h <- i
                cname.h <- paste("vdu", sufix.h, sep = ".")
                vdf <- subset(alldata, dl >= i)$v
                cvol[cname.h] <- sum(vdf)
            }
        }
        if (!all(is.na(hlu))) {
            for (i in hlu[order(hlu, decreasing = FALSE)]) {
                sufix.h <- i
                cname.h <- paste("vhu", sufix.h, sep = ".")
                vdf <- subset(alldata, hl <= i)$v
                cvol[cname.h] <- sum(vdf)
            }
        }
        ## append completevals to datares
        datares.full <- cbind(alldata, cvol)
        
        ## heights and diameters of relative volumes
        heights.all <- suppressWarnings({datana::interp(x = alldata$hl,
                                                        y = alldata$vrel.p,
                                                        ylu = rel.vol,
                                                        completename.x = "h_v",
                                                        method = "linear")})
        heights <- heights.all$completevals
        names(heights) <- gsub("\\.","",names(heights))

        diameters.all <- datana::interp(x = alldata$dl,
                                        y = alldata$vrel.p,
                                        ylu = rel.vol,
                                        completename.x = "dl_v",
                                        method = "linear")
        diameters <- diameters.all$completevals
        names(diameters) <- gsub("\\.","",names(diameters))
        rhd <- intercala.c(diameters, heights)
        ## append rel.vol.data to datares
        datares.full <- cbind(alldata, cvol, rhd)
        
        ## output of function ###########################################
        return(list(volumes = resdata,
                    datares = alldata,
                    merchv = cvol,
                    completevals = interpolated.vals,
                    rel.vol.data = rhd,
                    datares.full = datares.full))
    }
}
