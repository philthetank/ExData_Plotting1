source("plot.r")

source("plot2.r")
source("plot3.r")

plot4 <- function(fileName) {
  consumption <- readHCPFile(fileName)
  
  fun <- createMultiplot(consumption)
  writePNG(fileName = "plot4.png", plotFunction = fun)
}


createMultiplot <- function(consumption) {
  function() {
    old.par <-  par(mfrow = c(2,2))
    processData2(consumption)()
    createVoltageChart(consumption)
    processData3(consumption)()
    createGRPChart(consumption)
    par(old.par)
  }
}

createVoltageChart <- function(consumption) {
  dateTimes <- parseDateTimes(consumption)
  voltages <- consumption[,5]
  plot(x = dateTimes, y = voltages, type = "l", xlab = "datetime", ylab = "Voltage")
}

createGRPChart <- function(consumption) {
  dateTimes <- parseDateTimes(consumption)
  grp <- consumption[,4]
  plot(x = dateTimes, y = grp, type = "l", xlab = "datetime", ylab = "global_reactive_power")
}

plot4("~/Downloads/household_power_consumption.txt")