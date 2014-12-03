setwd("C://Documents and Settings//vivekakumar//Desktop")
vk <- "./data/household_power_consumption.txt"
vkk <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetvkk <- vkk[vkk$Date %in% c("1/2/2007","2/2/2007") ,]
str(subsetvkk)
globalActivePower <- as.numeric(subsetvkk$Global_active_power)
datetime <- strptime(paste(subsetvkk$Date, subsetvkk$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(subsetvkk$Sub_metering_1)
subMetering2 <- as.numeric(subsetvkk$Sub_metering_2)
subMetering3 <- as.numeric(subsetvkk$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
