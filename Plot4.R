# plot4.R - 2x2 Panel Plot

# Read data directly from file
data <- read.table(
  "C:/Users/vedik/OneDrive/Documents/exdata_data_household_power_consumption/household_power_consumption.txt",
  header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE
)

# Filter for Feb 1-2, 2007
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subdata <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Create datetime column
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time), format = "%Y-%m-%d %H:%M:%S")

# Create PNG
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Top-left: Global Active Power
plot(subdata$datetime, subdata$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# Top-right: Voltage
plot(subdata$datetime, subdata$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Bottom-left: Energy Sub Metering
plot(subdata$datetime, subdata$Sub_metering_1,
     type = "l", col = "black",
     xlab = "",
     ylab = "Energy sub metering")
lines(subdata$datetime, subdata$Sub_metering_2, col = "red")
lines(subdata$datetime, subdata$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")

# Bottom-right: Global Reactive Power
plot(subdata$datetime, subdata$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()