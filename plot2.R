setwd("C:/Course era/Assignments/Exploratory Data Week1")

#Reading Data from Text File
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

#Restricting the data based on data
Restrict_Data<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Creating a datetime field so as to use for plotting the exact time with the date
datetime <- strptime(paste(Restrict_Data$Date, Restrict_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Extracting the global active power
globalActivePower <- as.numeric(Restrict_Data$Global_active_power)

#Initiating the graphics device
png("plot2.png", width=480, height=480)

#Plotting the graph
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Device off
dev.off()