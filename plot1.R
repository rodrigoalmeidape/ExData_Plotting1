#Loading data
setwd("/Users/rodrigo/R")
ds <- read.table("./data/household_power_consumption.txt", sep=";", as.is = T, header = T, na.strings = "?", 
                 colClasses= c("character", "character", "numeric", "numeric", "numeric", "numeric",
                               "numeric", "numeric", "numeric")
)
ds[,"Date"] = as.Date(ds[,"Date"], format = "%d/%m/%Y")
feb <- ds[(ds$Date >= "2007-02-1" & ds$Date <= "2007-02-02"), ]
feb <- cbind(DateTime = strptime(paste(feb[,1], feb[,2]), format = "%Y-%m-%d %H:%M:%S"), feb[,3:9])


#Plot 1
png("./exdata-015/Project1/plot1.png", width=480,height=480, units = "px")

hist(feb$Global_active_power, 
     col="red", 
     main = "Global Active Power", 
     xlab = "Global Activie Power (kilowatts)"
)
dev.off()
     