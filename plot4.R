#Read the text file and assign "?" values to missing values.
householdpower <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?")

#Get subset of the data by choosing only 1/2/2007 and 2/2/2007
datesubset <- subset(householdpower, householdpower$Date == "1/2/2007" | householdpower$Date == "2/2/2007")
head(datesubset)

#add a column called dateandtime which allows the plotting of a graph by the time of the day
datesubset$dateandtime <- as.POSIXct(paste(datesubset$Date,datesubset$Time), format = "%d/%m/%Y %H:%M:%S")
tail(datesubset)

#two rows and two columns for the plots
png(filename = "plot4.png", width = 480, height= 480)
par(mfrow = c(2,2))

#plot1
plot(datesubset$dateandtime, datesubset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#plot2
plot(datesubset$dateandtime, datesubset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#plot3
plot(datesubset$dateandtime, datesubset$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(datesubset$dateandtime, datesubset$Sub_metering_2, col = "red")
lines(datesubset$dateandtime, datesubset$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1))

#plot4
plot(datesubset$dateandtime, datesubset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()

