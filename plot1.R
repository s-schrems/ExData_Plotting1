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

#  Getting Plot 1 going
png(file = "plot1.png", width = 480, height = 480)
hist(datafile2$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "red")
dev.off()