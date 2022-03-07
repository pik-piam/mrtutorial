#' Read WDI
#'
#' Read-in WDI (World development indicators) data .rda file as magclass
#' object.
#'
#'
#' @param subtype Type of WDI data that should be read. Please use the
#' worldbank indicator abbreviation. Available types are e.g.: \itemize{
#' \item \code{SP.POP.TOTL}: Population, total
#' \item \code{NY.GDP.MKTP.PP.CD}: GDP, PPP (current international Dollar)
#' \item \code{SL.AGR.EMPL.ZS}: Employment in agriculture as % of total employment
#' \item \code{NV.AGR.TOTL.CD}: Agricultural GDP (current international Dollar) }
#' @return magpie object of the WDI data
#' @author David Chen
#' @seealso \code{\link{readSource}} \code{\link{downloadTutorialWDI}}
#' @examples
#'
#' \dontrun{ a <- readSource(type="WDI",subtype="SP.POP.TOTL")
#' }
#' @importFrom dplyr select filter %>%
#' @importFrom tidyr pivot_longer
#' @importFrom magclass as.magpie
#' @importFrom rlang .data

readTutorialWDI<-function(subtype){

  load("WDI.rda")

  #convert the iso2c to iso3c using madrat tool
  wdi$iso2c <- toolCountry2isocode(wdi$iso2c)

  wdi <- wdi %>%
         dplyr::select(!.data$country)  %>%
         filter(!is.na(.data$iso2c)) %>%
         pivot_longer(cols=3:6) %>%
         as.magpie(spatial = 1, temporal = 2, replacement =".")

  wdi <- wdi[,,subtype]

  getNames(wdi) <- gsub("\\.", "_", getNames(wdi))
  # Replacement of . with _ in dimension is also done automatically in as.magpie()

  return(wdi)
}
