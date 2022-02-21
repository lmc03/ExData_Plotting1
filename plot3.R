#Read the text file and assign "?" values to missing values.
householdpower <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?")

#Get subset of the data by choosing only 1/2/2007 and 2/2/2007
datesubset <- subset(householdpower, householdpower$Date == "1/2/2007" | householdpower$Date == "2/2/2007")
head(datesubset)

#add a column called dateandtime which allows the plotting of a graph by the time of the day
datesubset$dateandtime <- as.POSIXct(paste(datesubset$Date,datesubset$Time), format = "%d/%m/%Y %H:%M:%S")
tail(datesubset) #check if dateandtime column has the correct format and values

#plot the graphs and save as a png
png(filename = "plot3.png", width = 480, height= 480)
plot(datesubset$dateandtime, datesubset$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(datesubset$dateandtime, datesubset$Sub_metering_2, col = "red")
lines(datesubset$dateandtime, datesubset$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1))
dev.off()

