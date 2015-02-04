fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "household_power.zip")
unzip("household_power.zip")

install.packages("data.table")
library(data.table)
dat <- fread("household_power_consumption.txt", header = T, na.strings = "?")

days <- dat[c(which(dat$Date == "1/2/2007"), which(dat$Date == "2/2/2007")),]
days$Date <- as.Date(days$Date, format = "%d/%m/%Y")

png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(days$Global_active_power), xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()