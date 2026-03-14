# plot3.R - Energy Sub Metering over Thu-Sat

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
png("plot3.png", width = 480, height = 480)

plot(subdata$datetime, subdata$Sub_metering_1,
     type = "l", col = "black",
     xlab = "",
     ylab = "Energy sub metering")

lines(subdata$datetime, subdata$Sub_metering_2, col = "red")
lines(subdata$datetime, subdata$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()