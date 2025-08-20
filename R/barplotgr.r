#' The function creates a barplot of numeric vector by one or two
#' factor.
#'
#' @title Function for building a barplot for one or two factors
#'
#' @rdname barplotgr
#' @param yvar The column having the variable to represent the height of
#' the bars.
#' @param factors A vector having the columns with the factors to be used
#' in the resulting plot. Notice that the last listed factor, will be used
#' in X-axis plot.
#' @param data A data frame having the above described columns.
#' @param percentage Logical value, set to `FALSE`.
#' @param errbar Please set this option to `FALSE`.
#' @param xlab Optional, as in the generic barplot function.
#' @param ylab Optional, as in the generic barplot function.
#' @param main Optional, as in the generic barplot function.
#' @param half.errbar Optional, default set to `TRUE`.
#' @param conf.level Optional, a numeric value for the confidence interval,
#' the default is 0.95.
#' @param names.arg Optional, as in the generic barplot function.
#' @param bar.col Optional, as in the generic barplot function.
#' @param whisker Optional, A numeric value, the default is 0.015.
#' @param args.errbar Optional, as in the generic barplot function.
#' @param args.errbar Optional, as in the generic barplot function.
#' @param legend Optional, as in the generic barplot function.
#' @param legend.text Optional, as in the generic barplot function.
#' @param args.legend Optional, as in the generic barplot function.
#' @param legend.border Optional, as in the generic barplot function.
#' @param box Optional, as in the generic barplot function.
#' @param args.yaxis Optional, as in the generic barplot function.
#' @param mar Optional, as in the generic barplot function.
#' @param ... list of columns to sort on
#'
#' @references
#'  The present function was modified from a similar one available at
#'   \url{https://github.com/mrxiaohe/R_Functions/blob/master/functions/bar}
#' @return The function returns the above described graph.
#' @author Christian Salas-Eljatib
#' @examples
#' data(standtabRauli2)
#' df <- standtabRauli2
#' head(df)
#' barplotgr(yvar = nha.cd, factors = c(bosque.id,cd), data = df,
#' errbar = FALSE, ylim=c(0, 640))
#' @import graphics stats utils grDevices
#' @export
barplotgr <- function(yvar, factors, data=data, percentage=FALSE,
              errbar=!percentage, half.errbar=TRUE, conf.level=.95,
              xlab=NULL, ylab=NULL, main=NULL,
              names.arg=NULL, bar.col="black", whisker=.015,args.errbar=NULL,
          legend=TRUE, legend.text=NULL, args.legend=NULL,legend.border=FALSE,
          box=TRUE, args.yaxis=NULL,
          mar=c(5,4,3,2),...){
  axes=!percentage
  dv.name<-substitute(yvar)
  if(length(dv.name)>1) stop("'yvar' only takes one variable")
  dv.name<-as.character(dv.name)
  dv<-data[[dv.name]]
  fnames<-substitute(factors)
  if(length(fnames)==1){
    factors<-as.character(fnames)
    nf<-1
  }else{
    factors<-as.character(fnames[-1L])
    nf<-length(factors)
  }
  if(nf>2) stop("This function accepts no more than 2 factors \n",
                "\t-i.e., it only plots one-way or two-way designs.")
  if(percentage & errbar){
    warning("percentage=TRUE; error bars were not plotted")
    errbar<-FALSE
  }
  if(!percentage) xbars<-tapply(dv, data[,factors], mean, na.rm=TRUE)
  else {
    xbars<-tapply(dv, list(interaction(data[,factors], lex.order=TRUE)), mean, na.rm=TRUE)
    if(sum(stats::na.omit(dv)!=0&stats::na.omit(dv)!=1)>0)
      stop("Data points in 'dv' need to be 0 or 1 in order to set 'percentage' to TRUE")
    xbars<-rbind(xbars, 1-xbars)*100
  }
  if(errbar){
    se<-tapply(dv, data[,factors], stats::sd, na.rm=TRUE)/sqrt(tapply(dv, data[,factors], length))
    conf.level=1-(1-conf.level)/2
    lo.bar<-xbars-se*stats::qnorm(conf.level)
    hi.bar<-xbars+se*stats::qnorm(conf.level)
  }
  extras<-list(...)
  if(legend & !percentage){
    if(is.null(legend.text))
      legend.text<-sort(unique(data[[factors[1]]]))
    args.legend.temp<-list(x="topright", bty=if(!legend.border)"n" else "o",
                           inset=c(0,0))
    if(is.list(args.legend))
      args.legend<-utils::modifyList(args.legend.temp, args.legend)
    else
      args.legend<-args.legend.temp
  } else if(legend & percentage){
    if(is.null(legend.text))
      legend.text<-c("1", "0")
    args.legend.temp<-list(x="topright", bty=if(!legend.border)"n" else "o",
                           inset=c(0,0))
    if(is.list(args.legend))
      args.legend<-utils::modifyList(args.legend.temp, args.legend)
    else
      args.legend<-args.legend.temp
  } else if(!legend){
    args.legend<-NULL
    legend.text<-NULL
  }
  if(errbar && legend && !percentage) ymax<-max(hi.bar)+max(hi.bar)/20
  else if(errbar && legend && percentage) ymax<-115
  else if(errbar && !legend) ymax <- max(xbars)
  else if(!errbar && legend && percentage) ymax<-110
  else if(!errbar) ymax<-max(xbars) + max(xbars)/20
  if(!percentage){
    args.barplot<-list(beside=TRUE, height=xbars, ylim=c(0, ymax), main=main, names.arg=names.arg,
                       col=grDevices::hcl(h=seq(0,270, 270/(length(unique(data[[factors[1]]]))))[-length(unique(data[[factors[1]]]))]),
                       legend.text=legend.text, args.legend=args.legend, xpd=TRUE,
                       xlab=if(is.null(xlab)) factors[length(factors)] else xlab,
                       ylab=if(is.null(ylab)) dv.name else ylab, axes=axes)
  }else{
    args.barplot<-list(beside=TRUE, height=xbars, ylim=c(0, ymax),  main=main, names.arg=names.arg,
                       col=grDevices::hcl(h=seq(0,270, 270/(length(unique(data[[factors[1]]]))))[-length(unique(data[[factors[1]]]))]),
                       legend.text=legend.text, args.legend=args.legend, xpd=TRUE,
                       xlab=if(is.null(xlab)) " "[length(factors)] else xlab,
                       ylab=if(is.null(ylab)) "percentage" else ylab, axes=axes)
  }
  args.barplot<-utils::modifyList(args.barplot, extras)
  errbars = function(xvals, cilo, cihi, whisker, nc, args.errbar = NULL, half.errbar=TRUE) {
    if(half.errbar){
      cilo<-(cihi+cilo)/2
    }
    fixedArgs.bar = list(graphics::matlines, x=list(xvals),
                         y=lapply(split(as.data.frame(t(do.call("rbind",
                                                                list(cihi, cilo)))),1:nc),matrix,
                                  nrow=2, byrow=T))
    allArgs.bar = c(fixedArgs.bar, args.errbar)
    whisker.len = whisker*(graphics::par("usr")[2] - graphics::par("usr")[1])/2
    whiskers = rbind((xvals - whisker.len)[1,],
                     (xvals + whisker.len)[1,])
    fixedArgs.lo = list(graphics::matlines, x=list(whiskers),
                        y=lapply(split(as.data.frame(t(do.call("rbind",
                                                               list(cilo, cilo)))), 1:nc), matrix, nrow=2, byrow=T))
    allArgs.bar.lo = c(fixedArgs.lo, args.errbar)
    fixedArgs.hi = list(graphics::matlines, x=list(whiskers),
                        y=lapply(split(as.data.frame(t(do.call("rbind",
                                                               list(cihi, cihi)))), 1:nc), matrix, nrow=2, byrow=T))
    allArgs.bar.hi = c(fixedArgs.hi, args.errbar)
    invisible(do.call(mapply, allArgs.bar))
    if(!half.errbar) invisible(do.call(mapply, allArgs.bar.lo))
    invisible(do.call(mapply, allArgs.bar.hi))
  }
  graphics::par(mar=mar)
  errloc<-as.vector(do.call(graphics::barplot, args.barplot))
  if(errbar){
    errloc<-rbind(errloc, errloc)
    lo.bar<-matrix(as.vector(lo.bar))
    hi.bar<-matrix(as.vector(hi.bar))
    args.errbar.temp<-list(col=bar.col, lty=1)
    args.errbar<-if(is.null(args.errbar)|!is.list(args.errbar))
      args.errbar.temp
    else if(is.list(args.errbar))
      utils::modifyList(args.errbar.temp, args.errbar)
    errbars(errloc, cilo=lo.bar, cihi=hi.bar, nc=1, whisker=whisker,
            args.errbar=args.errbar, half.errbar=half.errbar)
  }
  if(box) box()
  if(percentage){
    args.yaxis.temp<-list(at=seq(0,100, 20), las=1)
    args.yaxis<-if(!is.list(args.yaxis)) args.yaxis.temp else utils::modifyList(args.yaxis.temp, args.yaxis)
    do.call(graphics::axis, c(side=2, args.yaxis))
  }
}
#---------------------------
