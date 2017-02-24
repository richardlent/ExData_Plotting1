# plot2.R
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
png(file = "plot2.png", width = 480, height = 480, units = "px", bg = "gray87")

with(powerdata, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

dev.off()

