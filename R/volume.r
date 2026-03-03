#' Compute volume of objects
#'
#' @description Calculate the volume of objects, depending on
#' their shapes or available measurements, to carry out the
#' computation.
#'
#' @param form `string` indicating the form of the object to be
#' cubicated. The alternatives are the following: `cone`,
#' `cilinder`, `trapesoid` (also know as the Smalian's cubic
#' formula), `newton`, or `huber`.
#' @param d `vector` of diameter values.
#' @param d.u `string` indicating the unit of `d`. Can be any of `cm`
#' (default), `in`, `m` or `ft`.
#' @param h `vector` of height values.
#' @param h.u `string` indicating the unit of `h`. Can be any of `cm`,
#' `in`, `m` (default) or `ft`.
#' @param l Distance, generally the difference between two `h`
#' values. If `l` is given, `h` must not be given.
#' @param l.u `string` indicating the unit of `l`. Can be any of `cm`,
#' `in`, `m` (default) or `ft`.
#' @param o.u `string` indicating the unit of the calculated
#' volume. Can be any of `cm3`, `in3`, `m3` (default) or `ft3`.
#'
#' @returns Value of volume.
#'
#' @author Christian Salas-Eljatib and Nicolás Campos and
#' Victor Pacheco
#'
#' @examples
#' ##- Data, diameters at different stem heights
## hl are in meters, dl are in centimeters
#' df <- data.frame(hl = c(0.3, 3.9, 7), dl = c(40, 20, 10))
#' df
#' 
#' ##- Cilinder, needs a single diameter and height
#' dst <- df$dl[1]
#' hst <- df$hl[1]
#' ## output in cubic centimeters
#' volume(form = "cilinder", d = dst,  l = hst, o.u = "cm3")
#' ## in meters
#' volume(form = "cilinder", d = dst,  l = hst, o.u = "m3")
#' 
#' ##- Trapesoid between first and second measurement,
#' ## thus is for a single section.
#' dl.a <- df$dl[c(1, 2)]
#' hl.a <- df$hl[c(1, 2)]
#' 
#' vs1<-volume(h = hl.a, d = dl.a)
#' vs1
#' 
#' ##- Trapesoid, between first and third measurement
#' ## thus is for a single section.
#' dl.b <- df$dl[c(1, 3)]
#' hl.b <- df$hl[c(1, 3)]
#' volume(h = hl.b, d = dl.b)
#' 
#' 
#' dl.b <- df$dl[c(2, 3)]
#' hl.b <- df$hl[c(2, 3)]
#' vs2<-volume(h = hl.b, d = dl.b)
#' vs2
#' vs1+vs2
#' ##- Newton (only possible if three measurements are given)
#' volume(form = "newton",  h = df$hl, d = df$dl)
#' 
#' ##- Huber, for all available measurements
#' volume(form = "huber", d = df$dl, h = df$hl)
#' 
#' ##- Huber given 1 diameter and 1 distance
#' l.a <- diff(c(df$hl[1], df$hl[3]))
#' volume(form = "huber", d = df$d[2], l = l.a)
#'
#' @rdname volume
#' @export
##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
volume <- function(form = "trapesoid", d = NA, h = NA, l = NA,
                   d.u = "cm", h.u = "m", l.u = "m", o.u = "m3") {
    ## conditions ####################################################
    nd <- all(!is.na(d))
    nh <- all(!is.na(h))
    nl <- all(!is.na(l))
    ns <- c(nd, nh, nl)

    ## check units
    munits <- c("cm", "in", "m", "ft")
    vunits <- c(d.u, h.u, l.u)
    vars <- list(d, h, l)

    if (any(!vunits %in% munits)) {
        stop("provide valid measurements units")
    }

    ## necesary transformations
    if (o.u == "cm3") {
        for (i in 1:3) {
            if (ns[i]) {
                if (vunits[i] == "in") {
                    vars[[i]] <- vars[[i]] * 2.54
                }
                if (vunits[i] == "m") {
                    vars[[i]] <- vars[[i]] * 100
                }
                if (vunits[i] == "ft") {
                    vars[[i]] <- vars[[i]] * 2.54 * 12
                }
                if (vunits[i] == "cm") {
                    vars[[i]] <- vars[[i]]
                }
            }
        }
    } else if (o.u == "in3") {
        for (i in 1:3) {
            if (ns[i]) {
                if (vunits[i] == "in") {
                    vars[[i]] <- vars[[i]]
                }
                if (vunits[i] == "m") {
                    vars[[i]] <- vars[[i]] / 100 / 2.54
                }
                if (vunits[i] == "ft") {
                    vars[[i]] <- vars[[i]] / 12
                }
                if (vunits[i] == "cm") {
                    vars[[i]] <- vars[[i]] / 2.54
                }
            }
        }
    } else if (o.u == "m3") {
        for (i in 1:3) {
            if (ns[i]) {
                if (vunits[i] == "in") {
                    vars[[i]] <- vars[[i]] * 2.54 / 100
                }
                if (vunits[i] == "m") {
                    vars[[i]] <- vars[[i]]
                }
                if (vunits[i] == "ft") {
                    vars[[i]] <- vars[[i]] * 12 * 2.54 / 100
                }
                if (vunits[i] == "cm") {
                    vars[[i]] <- vars[[i]] / 100
                }
            }
        }
    } else if (o.u == "ft3") {
        for (i in 1:3) {
            if (ns[i]) {
                if (vunits[i] == "in") {
                    vars[[i]] <- vars[[i]] / 12
                }
                if (vunits[i] == "m") {
                    vars[[i]] <- vars[[i]] * 100 / 2.54 / 12
                }
                if (vunits[i] == "ft") {
                    vars[[i]] <- vars[[i]]
                }
                if (vunits[i] == "cm") {
                    vars[[i]] <- vars[[i]] / 2.54 / 12
                }
            }
        }
    } else {
        stop("provide a valid output unit")
    }

    d <- vars[[1]]
    h <- vars[[2]]
    l <- vars[[3]]

    ## volumes #######################################################
    ##- cilinder
    if (form == "cilinder") {
        if ((nd && length(d) == 1) && ((nl && length(l) == 1))) {
            area <-  d^2 * pi / 4
            vol <- area * l
        } else {
            stop("prove only one d and l")
        }
    }
    ##- cone
    if (form == "cone") {
        if ((nd && length(d) == 1) && ((nl && length(l) == 1))) {
            area <-  d^2 * pi / 4
            vol <- (area * l) / 3
        } else {
            stop("provide only one d and l")
        }
    }
    ##- smalian
    if (form %in% c("smalian", "trapesoid")) {
        ## if either hl or l is given (not both)
        if (xor(nh, nl)) {
            if (nd && length(d) == 2 && nh && length(h) == 2) {
                if (!nl) {
                    l <- abs(diff(h))
                }
            } else if (nd && length(d) == 2 && nl && length(l) == 1) {
                l <- l
            } else {
                stop("provide only two d , and two h or 1 l")
            }
        } else {
            stop("choose either h or l as length-variable")
        }

        ##!me pregunto, no debiera ademas, si uno quiere, generar
        ##!un resultado "FULL", donde salga, la seccion, su volumen,
        ##!el largo, el area menor y el area mayor
        vol <- (pi / 4) * 0.5 * l * (d[1]^2 + d[2]^2)
    }
    ##- newton
    if (form == "newton") {
        ## if either hl or l is given (not both)
        if (xor(nh, nl)) {
            if (nd && length(d) == 3 && nh && length(h) == 3) {
                ## check if data is secuencial
                if (!(all(diff(d) >= 0) || all(diff(d) <= 0))) {
                    stop("non sequential data")
                }
                if (!(all(diff(h) >= 0) || all(diff(h) <= 0))) {
                    stop("non sequential data")
                }
                if (!nl) {
                    l <- abs(diff(c(head(h, 1), tail(h, 1))))
                }
            } else if (nd && length(d) == 3 && nl && length(l) == 1) {
                l <- l
            } else {
                stop("provide only three d and 1 l")
            }
        } else {
            stop("provide only h or l")
        }
        ## area.inf <- d[1]^2 * pi / 4
        ## area.mid <- d[2]^2 * pi / 4
        ## area.sup <- d[3]^2 * pi / 4
        ## vol <- (area.inf + 4 * area.mid + area.sup) * l / 6
        vol <- (pi / 4) * (1 / 6) * l * (d[1]^2 + 4 * d[2]^2 + d[3]^2)
    }
    ##- huber
    if (form == "huber") {
        if (xor(nh, nl)) {
            if (!nl) {
                l <- abs(diff(c(head(h, 1), tail(h, 1))))
            } else if (nl && length(l == 1)) {
                l <- l
            } else {
                stop("provide only h or l")
            }
            if (nd && length(d) == 1) {
                d <- d
            } else if (nd && length(d) == 3) {
                d <- d[2]
            } else {
                stop("provide only one or three sequential d")
            }
        }
        ##! se debe aclarar, que al parecer como funciona huber, es que
        ##! todo lo trata como si fuera un solo objeto.
        ##! quizas huber, debiera calcularse, tanto cuando se da
        ##! un solo diametro y altura, asi como que lo haga para cuando
        ##! hay mediciones seguidas. Por defecto, el valor del diametro
        ##! en la mitad de la seccion se calculan en base a los valores de dl,
        ##! pero si se especifica que "dm=TRUE", entonces se calcula
        ##!utilizando esos. y ojo que #dm, solo se puede activar, cuando
        ##! huber ha sido seleccionada.
        ##!
        area <-  d^2 * pi / 4
        vol <- area * l
    }
    ##- final output
    return(vol)
}
