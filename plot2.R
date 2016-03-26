plot2 <- function(){
  data <- read.table("household_power_consumption.txt",na.strings = "?", 
                     stringsAsFactors = FALSE, header=TRUE, sep=";")
  data$Date <- as.Date(data$Date, format("%d/%m/%Y"))
  data <- subset(data, Date > "2007-01-31" & Date < "2007-02-03")
  data$DateTime <- strptime(paste(data$Date, data$Time), format("%Y-%m-%d %H:%M:%S"))
  png(filename = "plot2.png", width=480, height = 480, units = "px")
  par(mfrow = c(1,1))
  plot(data$DateTime, data$Global_active_power, type = "l", xlab="", 
       ylab = "Global Active Power(kilowatts)")
  dev.off()
}

