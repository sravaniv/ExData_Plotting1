#read the data
data<-read.table("household_power_consumption.txt", header=TRUE, sep =";",stringsAsFactors = FALSE,dec="."  )
#subset the data to include Feb 1 and Feb 2 2007 only
data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
#Transform Date and Time variables to Date/Time classes in R
data_sub$Date <- as.Date(data_sub$Date,  "d/%m/%Y")
data_sub$Time<-strptime(data_sub$Time, "%H:%M:%S")
data_sub[1:1440, "Time"]<-format(data_sub[1:1440, "Time"], "2007-02-01 %H:%M:%S")
data_sub[1441:2880, "Time"]<-format(data_sub[1441:2880, "Time"], "2007-02-02 %H:%M:%S")
data_sub$Global_active_power<-as.numeric(data_sub$Global_active_power)
data_sub$Sub_metering_1 <-as.numeric(data_sub$Sub_metering_1)
data_sub$Sub_metering_2 <-as.numeric(data_sub$Sub_metering_2)
data_sub$Sub_metering_3 <-as.numeric(data_sub$Sub_metering_3)
data_sub$Voltage <-as.numeric(data_sub$Voltage)
data_sub$Global_reactive_power <-as.numeric(data_sub$Global_reactive_power)
#Plot 3
png("plot3.png", width = 480, height = 480)
plot(data_sub$Time,data_sub$Sub_metering_1, type="n", xlab="Time", ylab = "Energy sub metering", main = "Energy Sub Metering Vs. Time")
with(data_sub, lines(Time,Sub_metering_1))
with(data_sub, lines(Time,Sub_metering_2, col="red"))
with(data_sub, lines(Time,Sub_metering_3, col="blue"))
legend("topright",lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
