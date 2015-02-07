setwd("/Users/scottschrems/Data_Science_Trek/Classes/4_Exploratory_Data_Analysis")

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "hpc.zip", method = "curl")
unzip("hpc.zip")
datafile <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
nrow(datafile)

datafile2 <- subset(datafile, datafile$Date == "1/2/2007"| datafile$Date == "2/2/2007")
datafile2$DateTime <- paste(datafile2$Date, datafile2$Time)
datafile2$DateTime1 <- strptime(datafile2$DateTime, "%d/%m/%Y %H:%M:%S")

rm(datafile)

par(mfrow = c(1,1))

#  Getting Plot 3 going
png(file = "plot3.png", width = 480, height = 480)
plot(datafile2$DateTime1, datafile2$Sub_metering_1, type = "l", ylab = "Energy Sub Metering", xlab = "")
lines(datafile2$DateTime1, datafile2$Sub_metering_2, col = "red")
lines(datafile2$DateTime1, datafile2$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
dev.off()