setwd("C:/Course era/Assignments/Exploratory Data Week1")

#Reading Data from Text File
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

#Restricting the data based on data
Restrict_Data<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Creating a datetime field so as to use for plotting the exact time with the date
datetime <- strptime(paste(Restrict_Data$Date, Restrict_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Extracting the global active power
globalActivePower <- as.numeric(Restrict_Data$Global_active_power)

#Submeter readings
subMetering1 <- as.numeric(Restrict_Data$Sub_metering_1)
subMetering2 <- as.numeric(Restrict_Data$Sub_metering_2)
subMetering3 <- as.numeric(Restrict_Data$Sub_metering_3)

#Initiating the graphics device
png("plot3.png", width=480, height=480)

#Ploting submeter_reading1
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

#Ploting submeter_reading2 with red color
lines(datetime, subMetering2, type="l", col="red")

#Plotting submeter_reading3 with blue color
lines(datetime, subMetering3, type="l", col="blue")

#Defining the legends
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Device off
dev.off()

