source("plot.r")

plot1 <- function(fileName) {
  consumption <- readHCPFile(fileName)
  fun <- processData1(consumption)
  writePNG(plotFunction = fun, fileName = "plot1.png")
}

processData1 <- function(consumption) {
  gap <- consumption[,3]
  createPlot1(gap)
}

createPlot1 <- function(gap) {
  function() {
    hist(gap, col = "red", xlab = "Global Active Power (kilowatts)", breaks = 12, main = "Global Active Power")
  }
}

plot1("~/Downloads/household_power_consumption.txt")
