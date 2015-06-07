#Loading data
setwd("/Users/rodrigo/R")
ds <- read.table("./data/household_power_consumption.txt", sep=";", as.is = T, header = T, na.strings = "?", 
                 colClasses= c("character", "character", "numeric", "numeric", "numeric", "numeric",
                               "numeric", "numeric", "numeric")
)
ds[,"Date"] = as.Date(ds[,"Date"], format = "%d/%m/%Y")
feb <- ds[(ds$Date >= "2007-02-1" & ds$Date <= "2007-02-02"), ]
feb <- cbind(DateTime = strptime(paste(feb[,1], feb[,2]), format = "%Y-%m-%d %H:%M:%S"), feb[,3:9])



#Plot 4

png("./exdata-015/Project1/plot4.png", width=480,height=480, units = "px")
par(mfrow = c(2,2))

#Plot (1,1)
plot(feb$DateTime, feb$Global_active_power, 
     ylab = "Global Activie Power (kilowatts)", 
     xlab = "", 
     type = "l")

#Plot (1,2)
plot(feb$DateTime, feb$Voltage, ylab="Voltage", xlab="datetime", type="l")

#Plot (2,1)
plot(feb$DateTime, feb$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub metering")
points(feb$DateTime, feb$Sub_metering_2, type = "l", col="red")
points(feb$DateTime, feb$Sub_metering_3, type = "l", col="blue")
legend("topright", lwd=1, col=c("black","red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot (2,2)
plot(feb$DateTime, feb$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")

#dev.copy(png, file = "./exdata-015/Project1/Plot4.png")
dev.off()