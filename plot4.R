setwd("~/Coursera R Files/Module 4 Week 1/ExData_Plotting1")
gap_data <- read.csv("../household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
plot1 <- subset(gap_data, Date %in% c("1/2/2007","2/2/2007"))
plot1$Date <- as.Date(plot1$Date, format="%d/%m/%Y")
plot1time <- paste(as.Date(plot1$Date), plot1$Time)
plot1$Datetime <- as.POSIXct(plot1time)
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(plot1, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_rective_power",xlab="")
})
dev.off()