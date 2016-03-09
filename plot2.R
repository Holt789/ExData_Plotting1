# Read the rows we are interested in from the household_power_consumption.txt 
powerConSub <- read.table("household_power_consumption.txt",skip=grep("1/2/2007", readLines("household_power_consumption.txt")), nrows=2879, sep=";", na.strings = "?")
colnames(powerConSub) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

png("plot2.png",width=480,height=480,units="px")
plot(powerConSub$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(1, at=1:1, labels=c("Thu"))
axis(1, at=1440:1440, labels=c("Fri"))
axis(1, at=2879:2879, labels=c("Sat"))

# Close off graphics device
dev.off()
