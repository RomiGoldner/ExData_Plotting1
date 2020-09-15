library(data.table)
read_file <- fread("household_power_consimption.txt")
head(read_file)
data_of_file <- data.frame(read_file)
View(read_file)

# Subset by dates
rel_Dates <- subset(data_of_file, Date == "2/2/2007" | Date == "1/2/2007")

#Make histogram
hist(as.numeric(rel_Dates$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
png(filename = "plot1.png", width = 480, height = 480)
dev.copy(png, file = "plot1.png")
dev.off()