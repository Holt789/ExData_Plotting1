# Read the rows we are interested in from the household_power_consumption.txt 
powerConSub <- read.table("household_power_consumption.txt",skip=grep("1/2/2007", readLines("household_power_consumption.txt")), nrows=2879, sep=";", na.strings = "?")
colnames(powerConSub) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Open graphics device
png("plot3.png",width=480,height=480,units="px")

# Create plot
plot(powerConSub$Sub_metering_1,  ylab="Energy sub metering", xlab="", xaxt="n", type="n")

# Add point/lines to plot
points(powerConSub$Sub_metering_1, type="l")
points(powerConSub$Sub_metering_2, type="l", col="red")
points(powerConSub$Sub_metering_3, type="l", col="blue")

# Set axis
axis(1, at=1:1, labels=c("Thu"))
axis(1, at=1440:1440, labels=c("Fri"))
axis(1, at=2879:2879, labels=c("Sat"))
legend("topright", pch=NA, lwd=1, col = c("black","blue", "red"), legend = c("Sub_meeting_1", "Sub_meeting_2","Sub_meeting_3"),lty=c(1,1,1))

# Close off graphics device
dev.off()
