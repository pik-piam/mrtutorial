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

readTutorialWDI<-function(subtype = "SP.POP.TOTL"){

  load("WDI.rda")

  #clean up: remove other country ids, remove rows with NAs as country,
             #pivot to long format and convert to magclass object
  wdi <- wdi %>%
         dplyr::select(!c(.data$country, .data$iso2c))  %>%
         filter(!is.na(.data$iso3c), .data$iso3c != "") %>%
         pivot_longer(cols = c("NY.GDP.MKTP.CD", "SP.POP.TOTL",
                               "SL.AGR.EMPL.ZS", "NV.AGR.TOTL.CD"),
                      names_to = "variable") %>%
         as.magpie(spatial = 1, temporal = 2, replacement =".")

  #select the subtype
  wdi <- wdi[, , subtype]

  getNames(wdi) <- gsub("\\.", "_", getNames(wdi))
  # Replacement of . with _ in dimension is also done automatically in as.magpie()

  return(wdi)
}
