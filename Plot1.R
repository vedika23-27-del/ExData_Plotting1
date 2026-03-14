# plot1.R - Global Active Power Histogram

# Read data directly from file
data <- read.table(
  "C:/Users/vedik/OneDrive/Documents/exdata_data_household_power_consumption/household_power_consumption.txt",
  header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE
)

# Filter for Feb 1-2, 2007
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subdata <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Create PNG
png("plot1.png", width = 480, height = 480)

hist(subdata$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.off()
