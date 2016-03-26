plot3 <- function(){
  data <- read.table("household_power_consumption.txt",na.strings = "?", 
                     stringsAsFactors = FALSE, header=TRUE, sep=";")
  data$Date <- as.Date(data$Date, format("%d/%m/%Y"))
  data <- subset(data, Date > "2007-01-31" & Date < "2007-02-03")
  data$DateTime <- strptime(paste(data$Date, data$Time), format("%Y-%m-%d %H:%M:%S"))
  png(filename = "plot3.png", width=480, height = 480, units = "px")
  par(mfrow = c(1,1))
  plot(data$DateTime, data$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
  lines(data$DateTime, data$Sub_metering_1, col="black")
  lines(data$DateTime, data$Sub_metering_2, col="red")
  lines(data$DateTime, data$Sub_metering_3, col="blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty = c(1,1,1), col = c("black","red","blue"))
  dev.off()
}
