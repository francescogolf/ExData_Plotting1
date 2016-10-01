##read data from file
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##select only 1,2 February
subSetData <- data[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
##Convert to datetime
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
##convert Global active power to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
##create plot and saves to plot2.png
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()