

x <- calcOutput("AgGDP", aggregate=FALSE)
y <- new.magpie(cells_and_regions = getRegions(x), years = getYears(x),
                names = c("grains", "vegetables", "livestock"))

y[,,"grains"] <- 0.2
y[,,"vegetables"] <- 0.15
y[,,"livestock"] <- 0.65

fulldim(x * y)
