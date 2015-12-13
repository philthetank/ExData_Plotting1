source("plot.r")

plot2 <- function(fileName) {
  consumption <- readHCPFile(fileName)
  fun <- processData2(consumption)
  writePNG(plotFunction = fun, fileName = "plot2.png")
}

processData2 <- function(consumption) {
  consumption <- consumption[,1:3]
  dateTimes <- parseDateTimes(consumption) #as.POSIXct(paste(consumption[,1], consumption[,2]), format = "%d/%m/%Y %H:%M:%S")
  gap <- as.numeric(consumption[,3])
  createPlot2(x = dateTimes, y = gap)
}

createPlot2 <- function(x, y) {
  function() {
    plot(x = x, y = y, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  }
}

plot2("~/Downloads/household_power_consumption.txt")
