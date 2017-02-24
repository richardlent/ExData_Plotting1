# plot1.R
# Richard A. Lent

library(data.table)

# Download and extract the data.
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "data.zip")
unzip("data.zip")

# Read the data, convert ? to NA, subset out the two days of interest.
powerdata <- fread("household_power_consumption.txt", na.strings=c("?"))
powerdata <- powerdata[(powerdata$Date == "1/2/2007"|powerdata$Date == "2/2/2007")]

# Plot the graph to a PNG file.
png(file = "plot1.png", width = 480, height = 480, units = "px", bg = "gray87")
with(powerdata, hist(Global_active_power, col = "red", 
    xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()



