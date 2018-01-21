setwd("C:/Course era/Assignments/Exploratory Data Week1")

#Reading Data from Text File
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

#Restricting the data based on data
Restrict_Data<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Extracting globalActivePower
globalActivePower<-as.numeric(Restrict_Data$Global_active_power)

#Activating graphics device
png("plot1.png", width=480, height=480)

#plotting the graph
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()