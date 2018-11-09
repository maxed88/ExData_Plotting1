dataFile <- file("./household_power_consumption.txt")
fileData <- grep("^[1,2]/2/2007", readLines(dataFile), value = TRUE) ##Retrieve data only from 1/2/2007 to 2/2/2007
plotData <- read.table(text = fileData, header = TRUE, sep = ";", na.strings = "?", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plotData$Date <- as.Date(plotData$Date, format = "%d/%m/%Y")
plotData$DateTime <- as.POSIXct(paste(plotData$Date, plotData$Time)) ##Might need to change timezone if appropriate

##Plot 4
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(plotData$DateTime, plotData$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatt)", col = "black", type = "l")
plot(plotData$DateTime, plotData$Voltage, col = "black", xlab = "datetime", ylab = "Voltage", type = "l")
plot(plotData$DateTime, plotData$Sub_metering_1, col = "black", xlab = "", ylab = "Energy sub metering", type = "l")
lines(plotData$DateTime, plotData$Sub_metering_2, col = "red")
lines(plotData$DateTime, plotData$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid", bty = "n")
plot(plotData$DateTime, plotData$Global_reactive_power, col = "black", xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()