dataFile <- file("./household_power_consumption.txt")
fileData <- grep("^[1,2]/2/2007", readLines(dataFile), value = TRUE) ##Retrieve data only from 1/2/2007 to 2/2/2007
plotData <- read.table(text = fileData, header = TRUE, sep = ";", na.strings = "?", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plotData$Date <- as.Date(plotData$Date, format = "%d/%m/%Y")
plotData$DateTime <- as.POSIXct(paste(plotData$Date, plotData$Time)) ##Might need to change timezone if appropriate

##Plot 2
plot(plotData$DateTime, plotData$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatt)", col = "black", type = "l")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()