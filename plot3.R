# plot3.R
# Richard A. Lent

library(data.table)
library(lubridate)

# Download and extract the data.
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "data.zip")
unzip("data.zip")

# Read the data, convert ? to NA, subset out the two days of interest.
powerdata <- fread("household_power_consumption.txt", na.strings=c("?"))
powerdata <- powerdata[(powerdata$Date == "1/2/2007"|powerdata$Date == "2/2/2007")]

# Create a Date-Time variable having format "%d/%m/%Y %H:%M:%S"
powerdata$DateTime <- paste(powerdata$Date, powerdata$Time, sep = " ")
powerdata$DateTime <- dmy_hms(powerdata$DateTime)

# Plot the graph to a PNG file.
png(file = "plot3.png", width = 480, height = 480, units = "px", bg = "gray87")

with(powerdata, plot(DateTime, Sub_metering_1, 
    type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(powerdata, lines(DateTime, Sub_metering_2, col = "red"))
with(powerdata, lines(DateTime, Sub_metering_3, col = "blue"))
legend( x= "topright", y=0.92, 
        legend=colnames(powerdata[1,7:9]),
        col=c("black", "red", "blue"),   
        lty = 1)

dev.off()


