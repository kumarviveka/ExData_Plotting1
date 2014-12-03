setwd("C://Documents and Settings//vivekakumar//Desktop")
vk <- "./data/household_power_consumption.txt"
vkk <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetvkk <- vkk[vkk$Date %in% c("1/2/2007","2/2/2007") ,]
str(subsetvkk)
globalActivePower <- as.numeric(subsetvkk$Global_active_power)
datetime <- strptime(paste(subsetvkk$Date, subsetvkk$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=280)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
