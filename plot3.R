
household <- read.table("household_power_consumption.txt", 
                        sep=";", header=T, colClasses="character")
household$Date <- as.Date(household$Date, format="%d/%m/%Y")

house <- subset(household, (household$Date >= as.Date("2007-02-01")))
house <- subset(house, (house$Date <= as.Date("2007-02-02")))

house$Global_active_power <- as.numeric(house$Global_active_power)
png("plot3.png")
plot(house$Date, house$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
points(house$Date, house$Sub_metering_2, type = 'l', col= "red")
points(house$Date, house$Sub_metering_3, type = 'l', col= "blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       pch="_", col=c("black", "red", "blue"))
dev.off()
