
household <- read.table("household_power_consumption.txt", 
                        sep=";", header=T, colClasses="character")
household$Date <- as.Date(household$Date, format="%d/%m/%Y")

house <- subset(household, (household$Date >= as.Date("2007-02-01")))
house <- subset(house, (house$Date <= as.Date("2007-02-02")))

house$Global_active_power <- as.numeric(house$Global_active_power)
png('plot1.png')
hist((house$Global_active_power),
     xlab="Global Active Power(kilowatts)", col="red",
     main="Global Active Power")
dev.off()
