setwd("G:\\【Coursera】\\Exploratory Analysis\\W1\\作业")
rawdata <-read.table("file:///G:/【Coursera】/Exploratory Analysis/W1/作业/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

head(rawdata)

Data<-rbind(subset(rawdata, Date=="1/2/2007"), subset(rawdata, Date=="2/2/2007"))
str(Data)


DT <- strptime(paste(Data$Date, Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Global_active_power <- as.numeric(Data$Global_active_power)
Global_reactive_power <- as.numeric(Data$Global_reactive_power)
Voltage <- as.numeric(Data$Voltage)
submetering_1 <- as.numeric(Data$Sub_metering_1)
submetering_2 <- as.numeric(Data$Sub_metering_2)
submetering_3 <- as.numeric(Data$Sub_metering_3)


png("Plot 4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(DT, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.3)

plot(DT, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(DT, submetering_1, type="l", ylab="Energy Submetering", xlab="")
lines(DT, submetering_2, type="l", col="red")
lines(DT, submetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=3, col=c("black", "red", "blue"), bty="o")

plot(DT, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()