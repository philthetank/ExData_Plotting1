source("plot.r")

plot3 <- function(fileName) {
  consumption <- readHCPFile(fileName)
  fun <- processData3(consumption)
  writePNG(plotFunction = fun, fileName = "plot3.png")
}

processData3 <- function(consumption) {
  consumption <- consumption[,c(1,2,7,8,9)]
  dateTimes <-parseDateTimes(consumption)
  sm1 <- consumption[,3]
  sm2 <- consumption[,4]
  sm3 <- consumption[,5]
  createPlot3(dateTimes, list(sm1, sm2, sm3))
}

createPlot3 <- function(x, ys) {
  function(){
    cols = c("black", "red", "blue")
    labels = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    plot(x = x, y = ys[[1]], xlab = "", type = "l", ylab = "Energy sub metering", bg = "transparent")
    for (i in 1:3) {
      lines(x = x, y = ys[[i]], col = cols[i], type = "l")  
    }
    legend("topright", legend =  labels, col = cols, lty = 1)
  }
}

plot3("~/Downloads/household_power_consumption.txt")
