plot4.R <- function() {
  library(graphics)
  
  setwd("C:/SriniWork/data/household_power_consumption")
  
  PowerConsumptionData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
  PowerConsumptionData <- subset(PowerConsumptionData, as.Date(PowerConsumptionData$Date,"%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") | as.Date(PowerConsumptionData$Date,"%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y"))
  PowerConsumptionData$DateTime <- paste(PowerConsumptionData$Date, PowerConsumptionData$Time)
  PowerConsumptionData$DateTime <- strptime(PowerConsumptionData$DateTime, "%d/%m/%Y %H:%M:%S")
  
  par(mfrow = c(2,2) )
  
  # Plot 1
  plot(PowerConsumptionData$DateTime, as.numeric(PowerConsumptionData$Global_active_power), xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
  
  lines(PowerConsumptionData$DateTime, as.numeric(PowerConsumptionData$Global_active_power), lwd = 2)
  
  # Plot 2 Datetime X-axis
  plot(PowerConsumptionData$DateTime, as.numeric(PowerConsumptionData$Voltage), xlab = "datetime", ylab = "Voltage", type = "n")
  
  lines(PowerConsumptionData$DateTime, as.numeric(PowerConsumptionData$Voltage), lwd = 2)
  
  # Plot 3 Multiple Lines
  
  plot(PowerConsumptionData$DateTime, as.numeric(PowerConsumptionData$Sub_metering_1), xlab = "", ylab = "Energy Sub Metering", type = "n")
  lines(PowerConsumptionData$DateTime, as.numeric(PowerConsumptionData$Sub_metering_1), col = "black")
  lines(PowerConsumptionData$DateTime, as.numeric(PowerConsumptionData$Sub_metering_2), col = "red")
  lines(PowerConsumptionData$DateTime, as.numeric(PowerConsumptionData$Sub_metering_3), col = "blue")
  legend( "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =c(1,1,1), col = c("black",  "red", "blue"), bty = "n", cex =.7 )
  
  # Plot 4
  plot(PowerConsumptionData$DateTime, as.numeric(PowerConsumptionData$Global_reactive_power), xlab = "datetime", ylab = "Global_reactive_power", type = "n")
  
  lines(PowerConsumptionData$DateTime, as.numeric(PowerConsumptionData$Global_reactive_power), lwd = 2)
  #
  # Copy to a PNG file
  #
  dev.copy(png, "plot4.png")
  dev.off()
  
}
