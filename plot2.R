#Read the text file and assign "?" values to missing values.
householdpower <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?")

#Get subset of the data by choosing only 1/2/2007 and 2/2/2007
datesubset <- subset(householdpower, householdpower$Date == "1/2/2007" | householdpower$Date == "2/2/2007")
head(datesubset)

#add a column called dateandtime which allows the plotting of a graph by the time of the day
datesubset$dateandtime <- as.POSIXct(paste(datesubset$Date,datesubset$Time), format = "%d/%m/%Y %H:%M:%S")
tail(datesubset) #check if dateandtime has the correct format and values

#Plot and save the png file
png(filename = "plot2.png", width = 480, height= 480)
plot(datesubset$dateandtime, datesubset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

