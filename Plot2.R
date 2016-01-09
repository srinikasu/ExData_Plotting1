plot2.R <- function() {
  
    setwd("C:/SriniWork/data/household_power_consumption")
    
    PowerConsumptionData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
    PowerConsumptionData <- subset(PowerConsumptionData, as.Date(PowerConsumptionData$Date,"%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") | as.Date(PowerConsumptionData$Date,"%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y"))
    PowerConsumptionData$DateTime <- paste(PowerConsumptionData$Date, PowerConsumptionData$Time)
    PowerConsumptionData$DateTime <- strptime(PowerConsumptionData$DateTime, "%d/%m/%Y %H:%M:%S")
    
       
     plot(PowerConsumptionData$DateTime, as.numeric(PowerConsumptionData$Global_active_power), xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
     
     lines(PowerConsumptionData$DateTime, as.numeric(PowerConsumptionData$Global_active_power), lwd = 2)
    
#
# Create the Png file
#
     dev.copy(png, "plot2.png")
     dev.off()
   }
