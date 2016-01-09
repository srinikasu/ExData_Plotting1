plot1.R <- function() {
  
   setwd("C:/SriniWork/data/household_power_consumption")
  

  PowerConsumptionData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
  PowerConsumptionData$Date <- as.Date(PowerConsumptionData$Date, "%d/%m/%Y")
  PowerConsumptionData <- subset(PowerConsumptionData, PowerConsumptionData$Date == "2007-02-01" | PowerConsumptionData$Date == "2007-02-02")
  hist(as.numeric(PowerConsumptionData$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")

  # Create a png Copy
  
  dev.copy(png, "plot1.png")
  dev.off()
}
