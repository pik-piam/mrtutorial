#' Dowload WDI
#'
#' Download WDI (World development indicators) data .rda file.
#'
#' @author  David Chen
#' @seealso  \code{\link{downloadSource}} \code{\link{WDI}}
#' @examples
#'
#' \dontrun{ a <- downloadSource(type="TutorialWDI")
#' }
#'
#' @importFrom WDI WDI WDIcache WDIsearch


downloadTutorialWDI<-function(){
  indicator <- c("NY.GDP.MKTP.CD", # gdp PPP current US$
                 "SP.POP.TOTL", # Total population
                 "SL.AGR.EMPL.ZS", #Employment in agriculture as % of total employment
                 "NV.AGR.TOTL.CD") # Ag GDP current US$
  wdi <- WDI(indicator = indicator,start= 1960, end = 2018)
  save(wdi,file = paste("WDI","rda",sep="."))
  
  return(list(url           = "https://data.worldbank.org/indicator/",
              doi           = NULL,
              title         = "World Bank Development Indicators",
              description   = "GDP and Population indicators",
              author        = NULL,
              unit          = NULL))
  
}
