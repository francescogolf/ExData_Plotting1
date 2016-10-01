##read data from file
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##select only 1,2 February
subSetData <- data[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
##Convert to datetime
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Convert submetering measures to numeric
sm1 <- as.numeric(subSetData$Sub_metering_1)
sm2 <- as.numeric(subSetData$Sub_metering_2)
sm3 <- as.numeric(subSetData$Sub_metering_3)

##convert Global active power to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)

##create plot and saves to plot3.png
png("plot3.png", width=480, height=480)
plot(datetime, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()