setwd("~/Coursera R Files/Module 4 Week 1/ExData_Plotting1")
gap_data <- read.csv("../household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
plot1 <- subset(gap_data, Date %in% c("1/2/2007","2/2/2007"))
plot1$Date <- as.Date(plot1$Date, format="%d/%m/%Y")
plot1time <- paste(as.Date(plot1$Date), plot1$Time)
plot1$Datetime <- as.POSIXct(plot1time)
png("plot3.png", width=480, height=480)
with(data1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()