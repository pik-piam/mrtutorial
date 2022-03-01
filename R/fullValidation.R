#' fullValidation
#'
#' Function that produces the complete validation data set used for evaluation of MAgPIE outputs
#'
#' @param rev data revision which should be used as input (positive numeric).
#' @author Jan Philipp Dietrich, Kristine Karstens
#' @seealso
#' \code{\link{readSource}}, \code{\link{getCalculations}}, \code{\link{calcOutput}}
#' @examples
#' \dontrun{
#' retrieveData("VALIDATION")
#' }
#' @importFrom madrat getConfig calcOutput
#' @importFrom lucode2 path

fullVALIDATION <- function(rev = 0.1) {

  # all validation data regional aggregations happens here

  # exitsting "validation.mif" file is loaded if all functions are set to append=TRUE
  # Please put the validation.mif into your output folder.
  # Use retrieveData("VALIDATION") to create a .tgz

  file.copy(lucode2::path(paste0(getConfig("mainfolder"), "/output/"), "validation.mif"),
            lucode2::path(getConfig("outputfolder"), "validation.mif"))

  valfile <- "validation.mif"

  # Add your validation scripts here
  calcOutput(type = "ValidPopulation", datasource = "WDI", aggregate = "REG+GLO",
             file = valfile, append = TRUE, warnNA = FALSE, try = TRUE)

}
