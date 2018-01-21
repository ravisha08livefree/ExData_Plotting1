setwd("C:/Course era/Assignments/Exploratory Data Week1")

#Reading Data from Text File
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

#Restricting the data based on data
Restrict_Data<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Creating a datetime field so as to use for plotting the exact time with the date
datetime <- strptime(paste(Restrict_Data$Date, Restrict_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Extracting the global active power
globalActivePower <- as.numeric(Restrict_Data$Global_active_power)

#Extracting global reactive power
globalReactivePower <- as.numeric(Restrict_Data$Global_reactive_power)

#Extracting voltage
voltage <- as.numeric(Restrict_Data$Voltage)

#Submeter readings
subMetering1 <- as.numeric(Restrict_Data$Sub_metering_1)
subMetering2 <- as.numeric(Restrict_Data$Sub_metering_2)
subMetering3 <- as.numeric(Restrict_Data$Sub_metering_3)

#Initiating the graphics device
png("plot4.png", width=480, height=480)

#making 2*2 graphs
par(mfrow = c(2, 2)) 

#Plotting graph1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Plotting graph2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#Plotting graph3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#Plotting graph4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#Device off
dev.off()