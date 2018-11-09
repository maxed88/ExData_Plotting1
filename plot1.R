dataFile <- file("./household_power_consumption.txt")
fileData <- grep("^[1,2]/2/2007", readLines(dataFile), value = TRUE) ##Retrieve data only from 1/2/2007 to 2/2/2007
plotData <- read.table(text = fileData, header = TRUE, sep = ";", na.strings = "?", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Plot 1
with(plotData, hist(Global_active_power, xlab = "Global Active Power (kilowatt)", ylab = "Frequency", main = "Global Active Power", col = "red"))
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()