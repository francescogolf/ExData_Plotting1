##read data from file
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##select only 1,2 February
subSetData <- data[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
##convert Global active power to numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
##create plot and saves to plot1.png
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()