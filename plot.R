writePNG <- function( fileName, plotFunction ) {
  png(file = fileName, width = 480, height = 480, bg = "transparent" )
  plotFunction()
  dev.off()
}

readHCPFile <- function ( fileName){
  read.delim(sep = ";", file = fileName, skip = 66637, nrows = 2880, header = FALSE, na.strings = "?")
}

parseDateTimes <- function (consumption){
  as.POSIXct(paste(consumption[,1], consumption[,2]), format = "%d/%m/%Y %H:%M:%S")  
}

