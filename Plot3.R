plot3.R <- function() {
library(graphics)

  setwd("C:/SriniWork/data/household_power_consumption")
  
  PowerConsumptionData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
  PowerConsumptionData <- subset(PowerConsumptionData, as.Date(PowerConsumptionData$Date,"%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") | as.Date(PowerConsumptionData$Date,"%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y"))
  PowerConsumptionData$DateTime <- paste(PowerConsumptionData$Date, PowerConsumptionData$Time)
  PowerConsumptionData$DateTime <- strptime(PowerConsumptionData$DateTime, "%d/%m/%Y %H:%M:%S")
  #
  # PLOT
  #
  plot(PowerConsumptionData$DateTime, as.numeric(PowerConsumptionData$Sub_metering_1), xlab = "", ylab = "Energy Sub Metering", type = "n")
  #
  # Lines
  #
  lines(PowerConsumptionData$DateTime, as.numeric(PowerConsumptionData$Sub_metering_1), lwd = 2, col = "black")
  lines(PowerConsumptionData$DateTime, as.numeric(PowerConsumptionData$Sub_metering_2), lwd = 2, col = "red")
  lines(PowerConsumptionData$DateTime, as.numeric(PowerConsumptionData$Sub_metering_3), lwd = 2, col = "blue")
  #
  # Legend
  #
  legend("topright", lty = 1, col = c("black",  "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  #
  # Copy to Png
  #
  dev.copy(png, "plot3.png")
  dev.off()
}
