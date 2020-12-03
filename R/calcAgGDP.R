#' @title calcAgGDP
#' @description calculates Ag GDP as % of total GDP
#'
#' @return List of magpie object with results on country  level, weight, unit and description.
#' @author David Chen
#' @examples
#'
#' \dontrun{
#' calcOutput("AgGDP")
#' }
#' @importFrom magclass collapseNames
#' @importFrom madrat readSource


calcAgGDP <- function(){

  gdp <- readSource("TutorialWDI", subtype="NY.GDP.MKTP.CD")
  ag_gdp <- readSource("TutorialWDI", subtype="NV.AGR.TOTL.CD")

  x <- ag_gdp/gdp
  x <- collapseNames(x)

  return(list(
    x=x,
    weight=NULL,
    unit="share",
    description="Ag GDP as percentage of total GDP"))
}
