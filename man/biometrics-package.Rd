\name{biometrics-package}
\alias{biometrics-package}
\alias{biometrics}
\docType{package}
\title{
\packageTitle{biometrics}
}
\description{
The **biometrics** package aims to apply quantitative analyses to forest 
ecology, silviculture, and decision-support systems. Besides, the package 
helps to carry out data management, exploratory analysis, and model assessment.

The main goal of **biometrics** is to provide reliable mathematical procedures
in a computing setting commonly used for quantitatively characterising trees
and forests. As such, the package offers an array of functions that build 
summary description tables and graphs, such as stand tables and diameter
distribution plots. Furthermore, the package has several data frames that
help illustrate the application of the functions and teach topics related 
to forest ecology, silviculture, and forest biometrics. 
The package relies heavily on the work and teaching style 
of [Christian Salas-Eljatib](\url{https://eljatib.com/}).

%\packageDescription{datana}
}

\details{
Notice that most of the available dataframes have a counterpart 
with column names in Spanish.
For instance, the dataframe 'mortaforest' has 
column names in English, but 'mortaforest2' has 
column names in Spanish. Both data frames 
have the same data. 

To see the preferable citation of the package, type citation("biometrics").

%The DESCRIPTION file:
%\packageDESCRIPTION{datana}
%\packageIndices{datana}
%~~ An overview of how to use the package, including the most %important functions ~~
}

\author{
\packageAuthor{biometrics}

Maintainer: \packageMaintainer{biometrics}

Christian Salas-Eljatib is also indebted to several people who have contributed
to individual data frames and functions: see credits in help pages.
}

\references{

- \url{https://biometriaforestal.uchile.cl}

- Salas-Eljatib C. 2021. Análisis de datos con el programa estadístico R: una 
introducción aplicada. Santiago, Chile: Ediciones Universidad Mayor. 
ISBN: 9789566086109. 
\url{https://www.buscalibre.cl/libro-analisis-de-datos-con-el-programa-estadistico-r/9789566086109/p/53775485}

}

\keyword{ package }
\examples{%#simple examples of the most important functions
##Scatter-plot and marginal histograms
data(popvol)
df <- popvol
hist(popvol$vol)

}
