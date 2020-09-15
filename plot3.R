library(data.table)
read_file <- fread("household_power_consumption.txt")
head(read_file)
data_of_file <- data.frame(read_file)
View(read_file)

# Subset by dates
rel_Dates <- subset(data_of_file, Date == "2/2/2007" | Date == "1/2/2007")
rel_Dates$Date <- as.Date(rel_Dates$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(rel_Dates$Date), rel_Dates$Time)
rel_Dates$Datetime <- as.POSIXct(datetime)

with(rel_Dates, plot(Datetime, Sub_metering_1, col = "black", type = "l", ylab = "Energy sub meeting", xlab = ""))
with(rel_Dates, lines(Datetime, Sub_metering_2, col = "red", type = "l")) 
with(rel_Dates, lines(Datetime, Sub_metering_3, col = "blue", type = "l"))

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))

png(filename = "plot3.png", width = 480, height = 480)
dev.copy(png, file = "plot3.png")
dev.off()
