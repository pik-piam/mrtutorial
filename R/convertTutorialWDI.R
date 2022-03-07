#' Convert WDI
#'
#' Convert WDI converts data from readWDI() to ISO country level. Adds Taiwan
#' as difference from global total.
#'
#'
#' @param x MAgPIE object containing WDI data region resolution
#' @param subtype Name of the worldbank indicator, e.g. "SP.POP.TOTL"
#' @return MAgPIE object of the WDI data disaggregated to country level
#' @author Jan Phillip Dietrich, Benjamin Bodirsky, Xiaoxi Wang, David Chen
#' @examples
#'
#' \dontrun{ a <- convertWDI(x)
#' }
#' @importFrom magclass getCells getCells<- dimSums clean_magpie getYears
#' @importFrom countrycode countrycode
#' @importFrom madrat toolCountryFill


convertTutorialWDI<-function(x, subtype){

  # change scale of absolute indicators, MAgPIE runs in Million scale for Pop and GDP drivers
if (subtype %in% c("NY.GDP.MKTP.CD",
                     "SP.POP.TOTL",
                     "NV.AGR.TOTL.CD")){

       out <- x/1e6 } else

 if (subtype == "SL.AGR.EMPL.ZS"){
        # don't change for percentage of ag employment

      out <- x } else{

      stop("subtype does not exist in the dataset!")}

  # toolCountryFill fills in missing countries - 249 required for aggregation

  x<-toolCountryFill(out,fill = 0)

  x[is.na(x)] <- 0  #remove NAs


  return(x)
}
