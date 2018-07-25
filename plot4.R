# Read raw data
data <- read.csv(file = 'household_power_consumption.txt', sep = ';', na.strings = '?');

# Set date format 
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Filter only relevant data
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )

# Convert date & time to DateTime and add it as a new column
dTime <- paste(data$Date, data$Time)
dTime <- strptime(dTime, '%Y-%m-%d %H:%M:%S')
data <- cbind(data, dTime)

# Create plot 4
png(filename = "plot4.png", width = 480, height = 480 )
par( mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data, {
  plot(Global_active_power ~ dTime, type="l", ylab = "Global Active Power (kilowatts)", xlab="") 
  plot(Voltage ~ dTime,             type="l", ylab = "Voltage (volt)", xlab="")
  plot(Sub_metering_1 ~ dTime,      type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2 ~ dTime, col='Red')
  lines(Sub_metering_3 ~ dTime, col='Blue')
  legend("topright", col = c("black", "red", "blue"),
         lty = 1, lwd = 2, bty = "n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
  plot(Global_reactive_power ~ dTime, type = "l",  ylab = "Global Rective Power (kilowatts)",xlab="")
})
dev.off()