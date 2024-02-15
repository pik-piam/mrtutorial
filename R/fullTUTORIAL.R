#' fullMAgPIE
#'
#' Function that produces the complete regional data set required for running the
#' MAgPIE model.
#'
#' @param rev data revision which should be used as input (numeric_version).
#' @param dev dev flag for testing
#' @param extra extra text to insert
#' @author David M Chen
#' @seealso
#' \code{\link{readSource}}, \code{\link{getCalculations}}, \code{\link{calcOutput}}
#' @examples
#' \dontrun{
#' retrieveData("tutorial", rev = numeric_version("12"),
#'              mainfolder = "pathtowhereallfilesarestored")
#' }
#' @importFrom magpiesets findset
#' @importFrom madrat toolGetMapping

fullTUTORIAL <- function(rev = numeric_version("1"), dev = "", extra = "Example Argument") {

  # ATTENTION: name of the model in function name must be in capital letters!

  "!# @pucArguments extra"

  writeLines(extra, "include_extra_text.txt")

  if (rev >= numeric_version("1")) {
    # Ag GDP
    calcOutput("AgGDP", round = 3, file = "fTUTORIAL_ag_gdp.csv")
  }
  if (dev == "test") {
    message("Here you could execute code for a hypothetical development version called \"test\"")
  }
  # return is optional, tag is appended to the tgz filename, pucTag is appended to the puc filename
  return(list(tag = "customizable_tag",
              pucTag = "tag"))
}
