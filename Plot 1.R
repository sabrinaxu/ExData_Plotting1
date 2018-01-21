setwd("G:\\【Coursera】\\Exploratory Analysis\\W1\\作业")
rawdata <-read.table("file:///G:/【Coursera】/Exploratory Analysis/W1/作业/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

head(rawdata)

Data<-rbind(subset(rawdata, Date=="1/2/2007"), subset(rawdata, Date=="2/2/2007"))
str(Data)


DT <- strptime(paste(Data$Date, Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Global_active_power <- as.numeric(Data$Global_active_power)

png("Plot 1.png", width=480, height=480)
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()