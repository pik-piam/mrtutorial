#' fullMAgPIE
#'
#' Function that produces the complete regional data set required for running the
#' MAgPIE model.
#'
#' @param rev data revision which should be used as input (positive numeric).
#' @author Jan Philipp Dietrich, Benjamin Leon Bodirsky, Florian Humpenoeder
#' @seealso
#' \code{\link{readSource}}, \code{\link{getCalculations}}, \code{\link{calcOutput}}
#' @examples
#' \dontrun{
#' fullMAgPIE(revision = 12, mainfolder = "pathtowhereallfilesarestored")
#' }
#' @importFrom magpiesets findset
#' @importFrom madrat toolGetMapping

fullTUTORIAL <- function(rev = 0.1) {

  magYears <- findset("time")

  cellsregions <- function(reg_revision = 0) { # nolint
    # function which calculates the name vector for spatial 0.5 degree MAgPIE data sets
    # containing MAgPIE cell number and corresponding region
    map <- toolGetMapping(type = "regional", name = getConfig("regionmapping"))
    regionscode <- regionscode(map)
    spatial_header <- spatialHeader(map) # nolint
    save(spatial_header, regionscode, map, reg_revision, file = "spatial_header.rda", compress = "xz")
  }
  cellsregions(rev)

  # data fully agrees with the data currently used in MAgPIE and new data set is implemented
  calcOutput("TauTotal",  years = 1995, round = 2, file = "fm_tau1995.cs4")

  # 09 drivers - Ag GDP
  calcOutput("AgGDP", aggregate = FALSE, years = magYears, round = 3, file = "fTUTORIAL_ag_gdp.csv")

}
