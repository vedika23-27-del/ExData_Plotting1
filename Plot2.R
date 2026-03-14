# plot2.R - Global Active Power over Thu-Sat

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
png("plot2.png", width = 480, height = 480)

plot(subdata$datetime, subdata$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
