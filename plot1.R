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

# Create plot 1
png(filename = "plot1.png", width = 480, height = 480 )
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()