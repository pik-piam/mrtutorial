#' fullMAgPIE
#'
#' Function that produces the complete regional data set required for running the
#' MAgPIE model.
#'
#' @param rev data revision which should be used as input (positive numeric).
#' \code{\link{setConfig}} (e.g. for setting the mainfolder if not already set
#' properly).
#' @author Jan Philipp Dietrich, Benjamin Leon Bodirsky, Florian Humpenoeder
#' @seealso
#' \code{\link{readSource}},\code{\link{getCalculations}},\code{\link{calcOutput}},\code{\link{setConfig}}
#' @examples
#'
#' \dontrun{
#' fullMAgPIE(revision=12, mainfolder="pathtowhereallfilesarestored")
#' }
#' @importFrom magpiesets findset
#' @importFrom madrat toolMappingFile

fullTUTORIAL <- function(rev=0.1) {

  mag_years <- findset("time")
  mag_years_past <- findset("past")
  short_years <- findset("t_all")

  cellsregions <- function(reg_revision=0) {
    # function which calculates the name vector for spatial 0.5 degree MAgPIE data sets
    # containing MAgPIE cell number and corresponding region
    cwd <- getwd()
    if(!file.exists(getConfig("outputfolder"))) dir.create(getConfig("outputfolder"),recursive = TRUE)
    setwd(getConfig("outputfolder"))
    map <- toolMappingFile("regional",getConfig("regionmapping"),readcsv = TRUE)
    regionscode <- regionscode(map)
    spatial_header <- spatial_header(map)
    save(spatial_header,regionscode,map,reg_revision,file="spatial_header.rda",compress="xz")
    setwd(cwd)
  }
  cellsregions(rev)

  # data fully agrees with the data currently used in MAgPIE and new data set is implemented
  calcOutput("TauTotal",  years=1995,        round=2, file="fm_tau1995.cs4")

  # 09 drivers - Ag GDP
  calcOutput("AgGDP",aggregate=FALSE, years=mag_years, round=3, file="fTUTORIAL_ag_gdp.csv") # please dont increase rounding, this can create errors

}
