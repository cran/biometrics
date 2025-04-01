#' Tree-level remeasurements for a sample plot in a Pinus radiata plantation
#'
#' @description
#' Temporal tree-level data from a sample plot established in a 
#' Monterey pine (Pinus radiata) forestry plantation in Chile.  
#' The plot size is 1600 m\eqn{^{2}}{^2}, and the plantation was established
#' in 1990. 
#' @usage
#' data(trlremeasu)
#' @format Tree list data for a sample plot remeasured through time, and
#' having the following columns
#' \describe{
#' \item{plot.id}{Plot code.}
#'   \item{tree}{Tree number.}
#' \item{x.coord}{Cartesian position in the X-axis, in m.}
#' \item{y.coord}{Cartesian position in the Y-axis, in m.}
#' \item{year}{Measurement year.}
#' \item{dead}{Dead identificator, 0 means alive, and 1 otherwise.}
#' \item{dbh}{diameter at breast-height, in cm.}
#'  }
#' @source 
#' Data were retrieved from the paper cited below, where several details 
#' might be worth reading. 
#' @references
#' - Pommerening A, Trincado G, Salas-Eljatib C, Burkhart H. 2023. 
#' Understanding and modelling the dynamics of data point clouds of
#'  relative growth rate and plant size. Forest Ecology and Management
#'  Volume 529:120652 \doi{10.1016/j.foreco.2022.120652}
#' @examples
#' data(trlremeasu)    
#' head(trlremeasu)
#' df<-trlremeasu
#' df$fe<-10000/1600
#' df$garb.ha<- (pi/40000)*df$dbh^2*df$fe
#' gha.t<-tapply(df$garb.ha, df$year, sum)
#' nha.t<-tapply(df$fe, df$year, sum);
#' time<-as.numeric(rownames(gha.t))
#' plot(nha.t~time, type="b",las=1)
#' plot(gha.t~time, type="b",las=1)
"trlremeasu"
#' Tree spatial coordinates in a large sample plot in Fennoscandia
#'
#' @description
#' Data from a large (8.8 ha) fully mapped plot in a Norway spruce (Picea abies) 
#' dominated old-growth forest in the subarctic region of Fennoscandia.
#' @usage
#' data(largeplot)
#' @format Contains Cartesian position of trees and other variables in 
#' a large sample plot, as follows:
#' \describe{
#'   \item{tree}{Tree ID.}
#'   \item{spp.code}{Species code as follows: 
#'   1=Pinus sylvestris,2=Picea abies,3=Betula pubescens,
#'   5=Salix caprea, 8: Sorbus aucuparia.}
#' \item{x.coord}{Cartesian position in the X-axis, in m.}
#' \item{y.coord}{Cartesian position in the Y-axis, in m.}
#' \item{status}{Measurement year.}
#' \item{dbh}{Diameter at breast-height, in cm.}
#' \item{toth}{Total height, in m.}
#'  }
#' @source 
#' Data were retrieved from the paper cited below, where several details 
#' might be worth reading. 
#' @references
#' - Pouta P, Kulha N, Kuuluvainen T, Aakala T. 2022. Partitioning of space 
#' among trees in an old-growth spruce forest in subarctic Fennoscandia. 
#' Frontiers in Forests and Global Change 5: 817248. 
#'  \doi{https://doi.org/10.3389/ffgc.2022.817248}
#' @examples
#' data(largeplot)    
#' head(largeplot)
#' df<-largeplot
#' pine <- df[df$spp.code==1,]
#' spruce <- df[df$spp.code==2,]
#' birch <- df[df$spp.code==3,]
#' plot(spruce$x.coord,spruce$y.coord,cex=(spruce$dbh)/30,col="blue")
#' points(birch$x.coord,birch$y.coord,cex=(birch$dbh)/30,col="green")
#' points(pine$x.coord,pine$y.coord,cex=(pine$dbh)/30,col="red")
"largeplot"
#' Smoothed tree list data from permanent sample plots
#'
#' @description
#' Temporal tree-level variables (smoothed-values) within four sample plots
#'  in an experimental forest in Austria. The dataframe contains all
#' the variables for all trees, where observation gaps were
#'  filled from monotone increasing predictive functions. 
#'  Plot sizes are 2500 m\eqn{^{2}}{^2} (approx.) and the current dataframe 
#'  only keeps the measurement years having a more reliable amount of records. 
#' @usage
#' data(trlsmoopsp)
#' @format Contains tree-level variables, as follows:
#' \describe{
#'   \item{plot}{Plot number.}
#'   \item{tree}{Tree identificator.}
#'   \item{year}{Year of measurement.}
#'   \item{species}{Species code as follows:
#'   PCAB=Picea abies, LADC=Larix decidua, PNSY=Pinus sylvestris, 
#'   FASY=Fagus Sylvatica, QCPE=Quercus petraea, BTPE=Betula pendula.}
#'   \item{obs}{Observation in this year.}
#'  \item{dbh}{Diameter at breast-height, in cm.}
#'  \item{toth}{Tree height, in m.}
#'  \item{hcb}{Height to the crown base, in m.}
#'  }
#' @source 
#' The Austrian Research Center for Forests established a spacing experiment
#'  with Norway spruce (Picea abies) in the Vienna Woods. In the 'Hauersteig' 
#'  experiment, several tree-level variables were measured within four sample 
#'  plots over time. Data were retrieved from the paper cited below, where several details 
#' might be worth reading.
#' @references 
#' - Kindermann G. Kristofel F, Neumann M, Rossler G, Ledermann T & Schueler. 
#' 2018. 109 years  of forest growth measurements from individual Norway
#'  spruce trees. Sci. Data 5:180077 \doi{10.1038/sdata.2018.77}
#' 
#' @examples
#' data(trlsmoopsp)
#' df<-trlsmoopsp    
#' head(df) 
#' table(df$year,df$plot)
#' tapply(df$dbh, list(df$year,df$plot), length)
'trlsmoopsp'
#' Temporal tree locations within a sample plot in the Vienna woods
#'
#' @description
#' Spatial location of trees remeasured through time for a sample plot in
#' an experimental forest in Austria. Other covariates are also available. 
#' @usage
#' data(spatimepsp)
#' @format Contains cartesian position of trees, and covariates, 
#' in a sample plot, as follows:
#' \describe{
#' \item{plot}{Plot number.}
#'   \item{tree}{Tree number.}
#'   \item{species}{Species code as follows:
#'   PCAB=Picea abies, LADC=Larix decidua, PNSY=Pinus sylvestris, 
#'   FASY=Fagus Sylvatica, QCPE=Quercus petraea, BTPE=Betula pendula.}
#' \item{x.coord}{Cartesian position in the X-axis, in m.}
#' \item{y.coord}{Cartesian position in the Y-axis, in m.}
#' \item{year}{Measurement year.}
#' \item{dbh}{diameter at breast-height, in cm.}
#'  }
#' @source 
#' The Austrian Research Center for Forests established a spacing experiment
#'  with Norway spruce (Picea abies) in the Vienna Woods. In the 'Hauersteig' 
#'  experiment, several tree-level variables were measured within four sample 
#'  plots over time. 
#' Data were retrieved from the paper cited below, where several details 
#' might be worth reading. 
#' @references
#' - Kindermann G. Kristofel F, Neumann M, Rossler G, Ledermann T & Schueler. 
#' 2018. 109 years  of forest growth measurements from individual Norway
#'  spruce trees. Sci. Data 5:180077 \doi{10.1038/sdata.2018.77}
#' @examples
#' data(spatimepsp)    
#' head(spatimepsp)
#' df<-spatimepsp
#' lattice::xyplot(y.coord~x.coord|as.factor(year),
#' data=df,as.table=TRUE)
"spatimepsp"
#' Long term tree-list data from permanent sample plots
#'
#' @description
#' Temporal tree-level data within four sample plots
#'  in an experimental forest in Austria. The dataframe contains several
#' tree-level variables. Plot sizes are 2500 m\eqn{^{2}}{^2} (approx.) 
#' and the current dataframe only keeps the measurement years having
#'  a more reliable amount of records. 
#' @usage
#' data(trlpsptime)
#' @format Contains tree-level variables, as follows:
#' \describe{
#'   \item{plot}{Plot number.}
#'   \item{tree}{Tree identificator.}
#'   \item{species}{Species code as follows:
#'   PCAB=Picea abies, LADC=Larix decidua, PNSY=Pinus sylvestris, 
#'   FASY=Fagus Sylvatica, QCPE=Quercus petraea, BTPE=Betula pendula.}
#'   \item{year}{Year of measurement.}
#'   \item{obs}{Observation.}
#'  \item{dbh}{Diameter at breast-height, in mm.}
#'  \item{dbh2}{Orthogonal measured second diameter, in mm.}
#'  \item{hmk}{Selection criteria to measure tree height. 
#'  1=systematic, 2=systematic and in the group of the 100 thickest, 
#'  3=belongs to the 100 thickest, 4=lying tree, 5:Standing tree with a ladder,
#'  6=outlier, 7=from stem analysis.}
#'  \item{kh}{Type of the height measurement. 0:tree height, 
#'  1:angle and distances.}
#'  \item{ho}{Tree height in dm when kh=0. When kh=1 then distance to the tree
#'   in dm or in 1977 length of the base bar in cm.}
#'  \item{ka}{Height to the crown base in dm when kh=0. When kh=1 then angle 
#'  to the tree top in 1/10 degree.}
#'  \item{kb}{Crown width in dm when kh=0. When kh=1 then angle to 1.3 m 
#'  above tree base in 1/10 degree.}
#'  \item{wka}{Angle to crown base in 1/10 degree.}
#'  \item{crown.cl}{Crown class according to Kraft. 1=predominant, 
#'  2=dominant, 3=co-dominant, 4=dominated, 5=overtopped.}
#'  \item{crown}{Crown quality. 0=normal, 1=broken in the crown region, 
#'  2=substituted tree top, 3=forked, 4=bushy, stork nest, witches' broom, 
#'  5=wizen tree top, 6=again broken tree top.}
#'  \item{stem}{Stem quality. 0=typical, 1=crooked, 2=abiotic damaged, 
#'  3=biotic damaged, 4=forked stem without damage, 5=forked stem with damage, 
#'  6=up to 1/3 of the girth is peeled, 
#'  7=more than 1/3 of the girth is peeled, 
#'  8=broken stem, 9=other stem damages.}
#'  \item{defoliation}{crown defoliation. 1=low, 2=medium, 3=much.}
#'  }
#' @source 
#' The Austrian Research Center for Forests established a spacing experiment
#'  with Norway spruce (Picea abies) in the Vienna Woods. In the 'Hauersteig' 
#'  experiment, several tree-level variables were measured within four sample 
#'  plots over time.
#' Data were retrieved from the paper cited below, where several details 
#' might be worth reading. 
#' @references 
#' - Kindermann G. Kristofel F, Neumann M, Rossler G, Ledermann T & Schueler. 
#' 2018. 109 years  of forest growth measurements from individual Norway
#'  spruce trees. Sci. Data 5:180077 \doi{10.1038/sdata.2018.77}
#' 
#' @examples
#' data(trlpsptime)
#' df<-trlpsptime    
#' head(df) 
#' tapply(df$dbh, list(df$year,df$plot), mean)
'trlpsptime'
#' Tree locations within sample plots in an experimental forest in Austria
#'
#' @description
#' The Austrian Research Center for Forests established a spacing experiment
#'  with Norway spruce (Picea abies) in the Vienna Woods. In the 'Hauersteig' 
#'  experiment, several tree-level variables were measured within four sample 
#'  plots over time. The current dataframe has only the measurements
#'   carried out in 1944.
#' @usage
#' data(spataustria)
#' @format Contains cartesian position of trees, and covariates, 
#' in sample plots, as follows:
#' \describe{
#' \item{plot}{Plot number.}
#'   \item{tree}{Tree number.}
#'   \item{species}{Species code as follows:
#'   PCAB=Picea abies, LADC=Larix decidua, PNSY=Pinus sylvestris, 
#'   FASY=Fagus Sylvatica, QCPE=Quercus petraea, BTPE=Betula pendula.}
#' \item{x.coord}{Cartesian position in the X-axis, in m.}
#' \item{y.coord}{Cartesian position in the Y-axis, in m.}
#' \item{year}{Measurement year.}
#' \item{dbh}{diameter at breast-height, in cm.}
#'  }
#' @source 
#' Data were retrieved from the paper cited below, where several details 
#' might be worth reading. For instance, plot size slightly varies among plots:
#'  Plot No. 1=2509.7 m\eqn{^{2}}{^2}, Plot No. 2=2474.8 m\eqn{^{2}}{^2}, 
#'  Plot No. 3=2415.9 m\eqn{^{2}}{^2}, and Plot 4=2482.8 m\eqn{^{2}}{^2}.
#' @references
#' - Kindermann G. Kristofel F, Neumann M, Rossler G, Ledermann T & Schueler. 
#' 2018. 109 years  of forest growth measurements from individual Norway
#'  spruce trees. Sci. Data 5:180077 \doi{10.1038/sdata.2018.77}
#' @examples
#' data(spataustria)    
#' head(spataustria)
#' df<-spataustria
#' oldpar<-par(mar=c(4,4,0,0))
#' bord<-data.frame(
#'  x=c(min(df$x.coord),max(df$x.coord),min(df$x.coord),max(df$x.coord)),
#'  y=c(min(df$y.coord),min(df$y.coord),max(df$y.coord),min(df$y.coord))
#'  )
#' plot(bord,type="n", xlab="x (m)", ylab="y (m)", asp=1, bty='n')
#' points(df$x.coord,df$y.coord,col=df$plot,cex=0.5) 
#' par(oldpar)
"spataustria"
#' Population of stand-volume for 400 elements. 
#'
#' @description
#' A list of elements containing stand-volume (in m\eqn{^{3}}{^3}/ha) values measured
#' in sample plots. Thus, the population size is 400, and the random variable is
#' forest volume.  The values were digitized from the book of Zohrer (1980). 
#' @usage
#' data(popvol)
#' @format Contains two variables, as follows:
#' \describe{
#'   \item{id}{Plot number, or ID.}
#' \item{vol}{Stand volume, in m\eqn{^{3}}{^3}/ha}
#'  }
#' @source 
#' Population data of forest volume. Each row represents a plot, and
#' their respective measured standing trees volume. Data from Zhorer (1980).
#' @references
#' - Zohrer F. 1980. Forstinventur. Ein Leitfaden fur Studium und Praxis.
#'  Pareys Studientexte Nr. 26. Parey. Berlin, Germany. 207
#' @examples
#' data(popvol)    
#' sum(popvol$vol) 
#' mean(popvol$vol) 
#' hist(popvol$vol)
'popvol'
#' Maximum plant size in the Hawaiian archipelago.  
#' @description
#' Maximum plant size of 58 tree species, shrub and tree fern species that
#'  occur 
#' in 530 forest plots across the Hawaiian archipelago. 
#' @usage
#' data(plantshawaii)
#' @format Contains six columns, as follows:
#' \describe{
#'   \item{species}{Genus and epithet of the species.}
#'   \item{family}{Family of each species.}
#' \item{native.status}{Categorical variable ('native', 'alien', 'uncertain')
#'  indicating alien status of each individual following Wagner et al. (2005).}
#' \item{n}{Number of individuals used to estimate maximum plant size.}
#' \item{d95}{Maximum plant size, estimated as D950.1 (King et al. 2006).}
#' \item{dmax3}{Maximum plant size, estimated as Dmax3 (King et al. 2006).}
#'  }
#' @source 
#' The data were obtained from the DRYAD repository 
#' at \doi{10.5061/dryad.1kk02qr}.  
#' @references
#' - Craven D, Knight T, Barton K, Bialic-Murphy L, Cordell S, Giardina C, 
#' Gillespie T, Ostertag R, Sack L,Chase J.
#' 2018. OpenNahele: the open Hawaiian forest plot database. Biodiversity 
#' Data Journal 6: e28406. 
#' @examples
#' data(plantshawaii)    
#' head(plantshawaii) 
#' tapply(plantshawaii$d95,plantshawaii$native.status,summary)
'plantshawaii'
#' Tree-level information of forest plots across the Hawaiian archipelago.  
#' @description
#' Diameter at breast height (or occurrence) of individual trees, shrubs 
#' and tree
#'  ferns across 530 plots across the Hawaiian archipelago and includes native
#'   status and cultivated status of the 185 species.   
#' @usage
#' data(trlhawaii)
#' @format Contains 18 variables, as follows:
#' \describe{
#'   \item{island}{Island name.}
#'   \item{plot.id}{Unique numeric identifier for each plot.}
#' \item{study}{Brief name of study.}
#' \item{plot.area}{Plot area in m\eqn{^{2}}{^2}.}
#' \item{longitude}{Longitude of plot in decimal degrees; WGS84 coordinate
#'  system.}
#' \item{latitude}{Latitude of plot in decimal degrees; WGS84 coordinate
#'  system.}
#' \item{year}{Year in which plot data was collected.}
#' \item{census}{Numeric identifier for each census.}
#' \item{tree.id}{Unique numeric identifier for each individual.}
#' \item{scientific.name}{Genus and species of each individual following 
#' TPL v. 1.1.}
#' \item{family}{Family of each individual following TPL v. 1.1.}
#' \item{angiosperm}{Binary variable (1 = yes, 0 = no) indicating whether
#'  an individual is classified as an angiosperm following APG III.}
#' \item{monocot}{Binary variable (1 = yes, 0 = no) indicating whether an
#'  individual is classified as a monocot following APG III.}
#' \item{native.status}{Categorical variable ("native", "alien", "uncertain")
#'  indicating alien status of each individual following Wagner et al. (2005).}
#' \item{cultivated.status}{Binary variable (1 = yes, 0 = no,
#'  NA = not applicable) indicating if species is cultivated following PIER.}
#' \item{abundance}{Number of individuals (all = 1).}
#' \item{abundance.ha}{Abundance of each individual on a per hectare basis.}
#' \item{dbh}{Diameter at 1.3 m (in cm) for each individual; NA indicates that 
#' size was not measured, but was classified by size class.}
#'  }
#' @source 
#' The data were obtained from the DRYAD
#'  repository at \doi{10.5061/dryad.1kk02qr}.
#' @references
#' - Craven D, Knight T, Barton K, Bialic-Murphy L, Cordell S, 
#' Giardina C, Gillespie T, Ostertag R, Sack L,Chase J. 2018. 
#' OpenNahele: the open Hawaiian forest plot database.
#'  Biodiversity Data Journal 6: e28406.   
#' @examples
#' data(trlhawaii)  
#' table(trlhawaii$island,trlhawaii$study)   
#' unique(trlhawaii$plot.id) 
#' table(trlhawaii$plot.id) 
#' tapply(trlhawaii$plot.area,trlhawaii$study,summary)
'trlhawaii'
#' Mortality of lianas (vines) in tropical forests
#'
#' @description
#' This study is part of the project "Diversity and dynamics of vascular
#'  epiphytes in Colombian Andes" 
#' supported by COLCIENCIAS (contract 2115-2013). The data corresponds to
#'  the first large-scale 
#' assessment of vascular epiphyte mortality in the neotropics. Based on two 
#' consecutive annual surveys,
#' we followed the fate of 4247 epiphytes to estimate the epiphyte mortality 
#' rate on 116 host trees
#' at nine sites. Additional variables were taken from the area of study in 
#' order to find relationships
#' with epiphyte mortality.
#' @usage
#' data(deadlianas)
#' @format The data frame contains four variables as follows:
#' \describe{
#' \item{PlotSite}{Municipality name of the 9 study sites}					
#' \item{Y.Plot}{Latitude of the plot in decimal degrees}
#' \item{X.Plot}{Longitude of the plot in decimal degrees}
#' \item{PhoroNo}{ID number of the sampled host trees in each site}
#' \item{EpiFam}{Epiphyte taxonomic family}
#' \item{EpiGen}{Epiphyte taxonomic genus}
#' \item{cf.aff}{Abbreviations of Latin terms in the context of taxonomy. cf.
#'  "confer" meaning "compare with". aff.: "affinis" meaning "similar to".}
#' \item{Species}{Epiphyte (morpho) species name}
#' \item{Author}{Author of the scientific name}
#' \item{EpiAzi}{Azimuth of the epiphyte individual on each host tree}
#' \item{BraAzi}{Azimuth of the branch in which the epiphyte individual was 
#' found}
#' \item{EpiDisTru}{Distance in meters from the trunk to the epiphyte 
#' attachment site on a branch}
#' \item{EpiSize}{Estimated size of the epiphyte individual, in cm.}
#' \item{EpiAttHei}{Epiphyte attachment height in meters}
#' \item{Date0}{Date of the first census}
#' \item{Date1}{Date of the final census}
#' \item{Location}{Section (roots, trunks, branches) of the host tree in 
#' which theepiphyte individual was found}
#' \item{Mortality}{Dichotomous variable. 0 if the epiphyte individual was
#'  dead in the final census and 1 if otherwise}
#' \item{MorCat}{Mechanical or non-mechanical cause of mortality}
#' \item{Elevation}{Elevation (m a.s.l.) of the plot}
#' \item{AP_bio12}{Annual precipitation in the plot (mm yr-1)}
#' \item{PDM_bio14}{Precipitation of driest month in the plot (mm)}
#' \item{PS_bio15}{Precipitation seasonality in the plot (coefficient of 
#' variation)}
#' \item{MDT_bio2}{Mean Diurnal Range (Mean of monthly (max temp - min temp))
#'  in the plot (oC*10)}
#' \item{TS_bio4}{Temperature seasonality in the plot (standard deviation*100)}
#' \item{ATR_bio7}{Annual temperature range in the plot (10 celsius degrees)}
#' \item{AET}{Actual evapotranspiration in the plot (mm yr-1)}
#' \item{BasAre}{Basal area of trees with DBH major or equal to 5 cm (AB) in
#'  the plot (m\eqn{^{2}}{^2}/ha)}
#' \item{BasAre5_10}{Basal area of trees with greater or equal than 5  DBH and 
#'  less than 10 cm in the plot (m\eqn{^{2}}{^2}/ha)}
#' \item{BasAre10}{Basal area of trees with greater or equal than 10 cm DBH in
#'  the plot (m\eqn{^{2}}{^2}/ha)}
#' \item{Ind10}{Number of canopy trees (with greater or equal than 10 cm DBH )
#'  in the plot}
#' \item{Ind5}{Number of understory trees (with greater or equal than 5 DBH and
#'   less than 10 cm) in the plot}
#' \item{Ind5_10}{Number of trees with greater or equal than 5  DBH and 
#' less than 10 cm in the plot}
#' \item{Ind10_15}{Number of trees with greater or equal than 10  DBH and  
#' less than 15 cm in the plot}
#' \item{Ind15_20}{Number of trees with greater or equal than 15  DBH and  
#' less than 20 cm in the plot}
#' \item{Ind20_25}{Number of trees with greater or equal than 20  DBH and  
#' less than 25 cm in the plot}
#' \item{Ind25_30}{Number of trees with greater or equal than 25  DBH and less 
#' than 30 cm in the plot}
#' \item{Ind30}{Number of trees with DBH major or equal to 30 cm in the plot}
#' \item{TreeHei}{Total tree height in meters}
#' \item{MedHei}{Median height of trees in each plot}
#' \item{MaxHei}{Maximum height of trees in each plot}
#' \item{BranchNumb}{Number of branches of the host tree}
#' \item{Obs}{Observations and notes in Spanish}
#'  }
#' @source 
#' Data were retrieved from the DRYAD repository at \doi{10.5061/dryad.g5510}.
#' @references
#' Zuleta D, Benavides AM, Lopez-Rios V, Duque A. 2016. Local and regional 
#' determinants
#' of vascular epiphyte mortality in the Andean mountains of Colombia. 
#' Journal of Ecology 104(3): 841-843. \doi{10.1111/1365-2745.12563}
#' @examples
#' data(deadlianas)    
#' head(deadlianas) 
'deadlianas'
#' Datos de mortalidad de lianas en árboles tropicales
#'
#' @description
#' Los datos provienen de un estudio que fue parte del proyecto "Diversidad y 
#' dinámica de epífitas vasculares en los Andes colombianos".
#' apoyado por COLCIENCIAS (contrato 2115-2013). Este conjunto de datos tiene
#'  43 columnas
#'  y 4247 filas. Cada fila corresponde a un individuo epifito ubicado en 
#'  secciones confiables de los árboles hospedantes  
#' Los datos corresponden a la primera gran escala
#' evaluación de la mortalidad de epífitas vasculares en los neotrópicos. 
#' Basado en dos encuestas anuales consecutivas,
#' Seguimos el destino de 4247 epífitas para estimar la tasa de mortalidad 
#' de epífitas en 116 árboles hospedantes.
#' en nueve sitios. Se tomaron variables adicionales del area de estudio
#'  para encontrar relaciones
#' con mortalidad de epifitas.
#' @usage
#' data(deadlianas2)
#' @format Variables se describen a continuación::
#' \describe{
#' \item{PlotSite}{Nombre del municipio de los 9 sitios de estudio.}					
#' \item{Y.Plot}{Latitud del grafico en grados decimales.}
#' \item{X.Plot}{Longitud de la grafica en grados decimales.}
#' \item{PhoroNo}{número de identificacion de los árboles hospedantes 
#' muestreados en cada sitio}
#' \item{EpiFam}{Familia taxonomica de epifitas.}
#' \item{EpiGen}{Genero taxonomico de epifitas.}
#' \item{cf.aff}{Abreviaturas de terminos latinos en el contexto de la 
#' taxonomia. cf. "conferir" que significa "comparar con". aff .: "affinis" 
#' que significa "similar a".}
#' \item{Species}{Nombre de la especie epifita (morfo)}
#' \item{Author}{Autor del nombre científico.}
#' \item{EpiAzi}{Azimut del individuo epifito en cada árbol huesped.}
#' \item{BraAzi}{Azimut de la rama en la que se encontro el individuo epifito.}
#' \item{EpiDisTru}{Distancia en metros desde el tronco hasta el sitio de union
#'  de la epifita en una rama.}
#' \item{EpiSize}{Tamaño estimado del individuo epifito en centimetros.}
#' \item{EpiAttHei}{Altura del accesorio de la epifita en metros.}
#' \item{Date0}{Fecha del primer censo.}
#' \item{Date1}{Fecha del censo final.}
#' \item{Location}{Seccion (raices, troncos, ramas) del árbol anfitrion en el
#'  que se encontro el individuo epifito.}
#' \item{Mortality}{Variable dicotomica. 0 si el individuo epifito estaba 
#' muerto en el censo final y 1 si no.}
#' \item{MorCat}{Causa de mortalidad mecanica o no mecánica.}
#' \item{Elevation}{Elevacion (msnm) de la parcela.}
#' \item{AP_bio12}{Precipitación anual en la parcela, en mm.}
#' \item{PDM_bio14}{Precipitación del mes más seco en la parcela, en mm.}
#' \item{PS_bio15}{Estacionalidad de la precipitacion en la parcela
#'  (coeficiente de variacion)}
#' \item{MDT_bio2}{Rango diurno medio (Media mensual 
#' (temperatura maxima - temperatura minima)) en la grafica (10 grados celsius)}
#' \item{TS_bio4}{Estacionalidad de la temperatura en la grafica 
#' (desviacion estandar * 100)}
#' \item{ATR_bio7}{Rango de temperatura anual en la parcela 
#' (10 grados centigrados)}
#' \item{AET}{Evapotranspiración anual en la parcela, en mm.}
#' \item{BasAre}{Area basal de árboles con DAP mayor o igual a 5 cm en 
#' la parcela, en m\eqn{^{2}}{^2}/ha.}
#' \item{BasAre5_10}{Area basal de árboles con DAP mayor o igual a 5 y 
#' menor a 10 cm en la parcela (m\eqn{^{2}}{^2}/ha)}
#' \item{BasAre10}{Area basal de árboles con DAP mayor o igual a 10 cm en
#'  la parcela (m\eqn{^{2}}{^2}/ha)}
#' \item{Ind10}{Número de árboles del dosel (con un DAP superior o 
#' igual a 10 cm) en la parcela}
#' \item{Ind5}{Número de árboles de sotobosque (con DAP mayor o igual 
#' a 5 y menor a 10 cm) en la parcela}
#' \item{Ind5_10}{Número de árboles con un DAP mayor o igual a 5 y menos 
#' de 10 cm en la parcela}
#' \item{Ind10_15}{Número de árboles con un DAP mayor o igual a 10 y menos
#'  de 15 cm en la parcela}
#' \item{Ind15_20}{Número de árboles con un DAP mayor o igual a 15 y menos 
#' de 20 cm en la parcela}
#' \item{Ind20_25}{Número de árboles con un DAP mayor o igual a 20 y menos 
#' de 25 cm en la parcela}
#' \item{Ind25_30}{Número de árboles con un DAP mayor o igual a 25 y menos 
#' de 30 cm en la parcela}
#' \item{Ind30}{Número de árboles con DAP mayor o igual a 30 cm en la parcela}
#' \item{TreeHei}{Altura total del árbol en metros}
#' \item{MedHei}{Altura media de los árboles en cada parcela}
#' \item{MaxHei}{Altura maxima de los árboles en cada parcela}
#' \item{BranchNumb}{Número de ramas del árbol anfitrion}
#' \item{Obs}{Observaciones y notas en español}
#'  }
#' @source 
#' Los datos fueron obtenidos desde el repositorio 
#' DRYAD \doi{10.5061/dryad.g5510}.
#' @references
#' Zuleta D, Benavides AM, Lopez-Rios V, Duque A. 2016. Local and 
#' regional determinants
#' of vascular epiphyte mortality in the Andean mountains of Colombia. 
#' Journal of Ecology 104(3): 841-843. \doi{10.1111/1365-2745.12563}
#' @examples
#' data(deadlianas2)    
#' head(deadlianas2) 
'deadlianas2'
#' Data contains  climatic, forest structure and forest mortality variable
#'
#' @description
#' The data file contains one row per unique 3.5km grid cell by year 
#' combination. The data frame covers 
#' all grid cells within the state of California where at least one Aerial
#'  Detection Survey (ADS) flight 
#' was taken between 2009 and 2015, so each grid cell position has between 
#' 1 and 7 years of data 
#' (reflected as 1 to 7 rows in the data file per grid cell position). 
#' The main response variables 
#' are mort.bin (presence of any mortality) and mort.tph (number of dead 
#' trees/ha within the given 
#' grid cell by year).
#' @usage
#' data(mortaforest)
#' @format The data frame contains four variables as follows:
#' \describe{
#' \item{live.bah}{Live basal area from the GNN dataset}											
#' \item{live.tph}{Live trees per hectare from the GNN dataset}
#' \item{pos.x}{rank-order x-position of the grid cell (position 1 is
#'  western-most)}
#' \item{pos.y}{rank-order y-position of the grid cell (position 1 is
#'  northern-most)}
#' \item{alb.x}{x-coordinate of the grid cell centroid in California 
#' Albers (EPSG 3310)}
#' \item{alb.y}{y-coordinate of the grid cell centroid in California 
#' Albers (EPSG 3310)}
#' \item{mort.bin}{1= dead trees observed in grid cell. 0= no dead 
#' trees observed}
#' \item{mort.tph}{Dead trees per hectare from the aggregated ADS dataset}
#' \item{mort.tpa}{Dead trees per acre from the aggregated ADS dataset}
#' \item{year}{Year of the ADS flight. Most flights occurred from May-August.}
#' \item{Defnorm}{Mean annual climatic water deficit for the grid cell, for 
#' Oct 1-Sept 31 water year, averaged from 1981-2015}
#' \item{Def0}{Climatic water deficit for the grid cell during the Oct-Sept 
#' water year overlapping the summer ADS flight of the given year}
#' \item{Defz0}{Z-score for climatic water deficit for the given grid 
#' cell/water year. Calculated as (Def0-Defnorm)/(standard deviation in
#'  deficit among all years 1981-2015 for the given grid cell)}
#' \item{Defz1}{Z-score for climatic water deficit for the given grid cell
#'  in the preceeding water year.}
#' \item{Defz2}{Z-score for climatic water deficit for the given grid cell 
#' two water years prior.}
#' \item{Tz0}{Z-score for temperature for the given grid cell/year.}
#' \item{Pz0}{Z-score for precipitation for the given grid cell/year.}
#' \item{Defquant}{FDCI variable. Quantile of Defnorm of the given grid cell,
#'  relative to the Defnorm of all other grid cells with a basal area
#'   within 2.5 m\eqn{^{2}}{^2}/ha of the given cell is basal area.}
#'  }
#' @source 
#' The data were obtained from the DRYAD repository \doi{10.5061/dryad.7vt36}
#' @references
#' - Young DJN, Stevens JS, Earles JM, Moore J, Ellis A, Jirka AM, 
#' Latimer ML. 2017.
#'      Long-term climate and competition explain forest mortality 
#'      patterns under extreme drought. Ecology Letters 20(1):78-86. 
#'      \doi{10.1111/ele.12711}
#' -Salas-Eljatib C, Fuentes-Ramírez A, Gregoire TG, Altamirano A, Yaitul V. 
#' A study on the effects of unbalanced data when
#'      fitting logistic regression models in ecology. 
#'      Ecological Indicators 85:502-508. \doi{10.1016/j.ecolind.2017.10.030}
#' @examples
#' data(mortaforest)    
#' head(mortaforest) 
'mortaforest'
#' Mortalidad en bosques, y variables climaticas y de estructura 
#' forestal en California (USA).  
#'
#' @description
#' El archivo de datos contiene una fila por combinacion unica de celda 
#' de cuadricula de 3,5 km por año. 
#' El marco de datos cubre todas las celdas de la cuadricula dentro del 
#' estado de California donde se 
#' tomo al menos un vuelo de la Encuesta de deteccion aerea (ADS) entre 
#' 2009 y 2015, por lo que cada posicion
#' de celda de la cuadricula tiene entre 1 y 7 años de datos (reflejados 
#' como 1 a 7 filas en el archivo de datos
#' por posicion de celda de cuadricula). Las principales variables de 
#' respuesta son mort.bin (presencia de alguna mortalidad)
#'  y mort.tph (número de árboles muertos /ha dentro de la celda de la
#'   cuadricula por año).
#' @usage
#' data(mortaforest2)
#' @format Las variables se describen a continuación::
#' \describe{
#' \item{live.bah}{Área basal viva del conjunto de datos GNN}											
#' \item{live.tph}{Árboles vivos por hectarea del conjunto de datos GNN}
#' \item{pos.x}{Posición X del orden de clasificacion de la celda de la
#'  cuadricula (la posición 1 es la mas occidental)}
#' \item{pos.y}{Posición Y del orden de clasificacion de la celda de la
#'  cuadricula (la posición 1 es la mas al norte)}
#' \item{alb.x}{Coordenada X del centroide de la celda de la cuadricula 
#' en California Albers (EPSG 3310)}
#' \item{alb.y}{Coordenada Y del centroide de la celda de la cuadricula 
#' en California Albers (EPSG 3310)}
#' \item{mort.bin}{Codificación para identificar mortalidad. 1 = árboles 
#' muertos observados en la celda de la cuadricula. 0 = no se observaron
#'  árboles muertos}
#' \item{mort.tph}{Árboles muertos por hectarea del conjunto de datos
#'  ADS agregado}
#' \item{mort.tpa}{Árboles muertos por acre del conjunto de datos 
#' ADS agregado}
#' \item{year}{año del vuelo de ADS. La mayoría de los vuelos se realizaron 
#' entre mayo y agosto}
#' \item{Defnorm}{Deficit hidrico climatico anual medio para la celda de
#'  la cuadricula, para el año hidrico del 1 de octubre al 31 de septiembre,
#'   promediado de 1981 a 2015}
#' \item{Def0}{Deficit de agua climatica para la celda de la cuadricula 
#' durante el año hidrologico de octubre a septiembre que se superpone al
#'  vuelo ADS de verano del año dado}
#' \item{Defz0}{Puntaje Z para el deficit hidrico climatico para la celda
#'  de cuadricula / año hidrico dado. Calculado como (Def0-Defnorm) / 
#'  (desviacion estandar en el deficit entre todos los años 1981-2015 para
#'   la celda de la cuadricula dada}
#' \item{Defz1}{Puntuacion Z para el deficit h?drico climatico para la 
#' celda de la cuadricula dada en el año hidrologico anterior.}
#' \item{Defz2}{Puntuacion Z para el deficit hidrico climatico para la 
#' celda de la cuadricula dada dos años antes.}
#' \item{Tz0}{Puntaje Z para la temperatura para la celda de 
#' cuadricula / año dado.}
#' \item{Pz0}{Puntaje Z para la precipitacion para la celda / año de la 
#' cuadricula dado.}
#' \item{Defquant}{Variable FDCI. Cuantil de Defnorm de la celda de la
#'  cuadricula dada, en relacion con la Defnorm de todas las demas celdas de
#'   la cuadricula con un area basal dentro de 2.5 m\eqn{^{2}}{^2}/ha de 
#'   la celda dada}
#'  }
#' @source 
#' Los datos fueron obtenidos desde el repositorio
#'  DRYAD en \doi{10.5061/dryad.7vt36}
#' @references
#' - Young DJN, Stevens JS, Earles JM, Moore J, Ellis A, Jirka AM, Latimer ML. 
#' 2017. Long-term climate and competition explain forest mortality 
#' patterns under extreme drought. Ecology Letters 20(1):78-86.
#'  \doi{10.1111/ele.12711}
#' - Salas-Eljatib C, Fuentes-Ramírez A, Gregoire TG, Altamirano A, 
#' and Yaitul V. 2018. A study on the effects of unbalanced data when
#'  fitting logistic regression models in ecology. 
#'  Ecological Indicators 85:502-508. \doi{10.1016/j.ecolind.2017.10.030}
#' @examples
#' data(mortaforest2)    
#' head(mortaforest2) 
'mortaforest2'