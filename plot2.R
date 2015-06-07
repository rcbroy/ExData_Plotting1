
household <- read.table("household_power_consumption.txt", 
                        sep=";", header=T, colClasses="character")
household$Date <- as.Date(household$Date, format="%d/%m/%Y")

house <- subset(household, (household$Date >= as.Date("2007-02-01")))
house <- subset(house, (house$Date <= as.Date("2007-02-02")))

house$Global_active_power <- as.numeric(house$Global_active_power)
house$Date <- strptime(paste(house$Date, house$Time), "%Y-%m-%d %H:%M:%S")
head(house$Date)
png("plot2.png")
plot(house$Date, house$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
