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

# Create plot 3
png(filename = "plot3.png", width = 480, height = 480 )
with(data, {
  plot(Sub_metering_1 ~ dTime,  type="l",   ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ dTime, col='Red')
  lines(Sub_metering_3 ~ dTime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()