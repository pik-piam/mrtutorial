#' Tool: spatialHeader
#'
#' Given a regionmapping (mapping between ISO countries and regions) the
#' function calculates a 0.5 degree spatial header for 0.5 degree magclass
#' objects
#'
#' @param mapping Either a path to a mapping or an already read-in mapping as
#' data.frame.
#' @return A vector with 59199 elements
#' @author Jan Philipp Dietrich
#' @seealso \code{\link{regionscode}}
#' @examples
#' \dontrun{
#' spatialHeader("regionmappingMAgPIE.csv")
#' }
#' @importFrom utils read.csv

spatialHeader <- function(mapping) {
  if (is.character(mapping)) {
    map <- read.csv(mapping, sep = ";")
  } else if (is.data.frame(mapping)) {
    map <- mapping
  } else {
    stop("Mapping is provided in an unsupported format. It should be either a character or a data.frame!")
  }
  regionscode <- regionscode(map)
  reg <- as.character(map$RegionCode)
  names(reg) <- as.character(map$CountryCode)
  iso <- toolGetMapping(type = "cell", name = "CountryToCellMapping.csv", where = "mappingfolder")$iso
  spatialHeader <- paste(reg[iso], seq_along(iso), sep = ".")
  return(spatialHeader)
}
