#Read the text file and assign "?" values to missing values.
householdpower <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?")

#Get subset of the data by choosing only 1/2/2007 and 2/2/2007
datesubset <- subset(householdpower, householdpower$Date == "1/2/2007" | householdpower$Date == "2/2/2007")

#Show the histogram and change the title and x-axis label and save png file
png(filename = "plot1.png", width = 480, height= 480)
hist(datesubset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()