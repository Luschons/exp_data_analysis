fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "household_power.zip")
unzip("household_power.zip")

install.packages("data.table")
library(data.table)
dat <- fread("household_power_consumption.txt", header = T, na.strings = "?")
dat <- data.frame(dat)
head(days)

days <- dat[c(which(dat$Date == "1/2/2007"), which(dat$Date == "2/2/2007")),]

datetime <- days[,1:2]
Date.Time <- paste(datetime$Date, datetime$Time)
dat <- cbind(Date.Time, days)
dat$Date.Time <- as.POSIXct(dat$Date.Time)

png(filename = "plot3.png", width = 480, height = 480)
plot(dat$Sub_metering_1 ~ dat$Date.Time, type = "n", pch = "", ylab = "Energy sub metering", xlab = "")
lines(dat$Sub_metering_1 ~ dat$Date.Time, type = "o", pch = "") 
lines(dat$Sub_metering_2 ~ dat$Date.Time, type = "o", pch = "", col = "red")
lines(dat$Sub_metering_3 ~ dat$Date.Time, type = "o", pch = "", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),  col = c("black", "red", "blue"), pch = "__")
dev.off()