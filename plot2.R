library(data.table)
read_file <- fread("household_power_consumption.txt")
head(read_file)
data_of_file <- data.frame(read_file)
View(read_file)

# Subset by dates
rel_Dates <- subset(data_of_file, Date == "2/2/2007" | Date == "1/2/2007")

# Make in date - time format
rel_Dates$Date <- as.Date(rel_Dates$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(rel_Dates$Date), rel_Dates$Time)
rel_Dates$Datetime <- as.POSIXct(datetime)

plot(rel_Dates$Datetime, rel_Dates$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

png(filename = "plot2.png", width = 480, height = 480)
dev.copy(png, file = "plot2.png")
dev.off()