data <- read.csv("household_power_consumption.txt", sep=";", colClasses="character")

data.sub <- subset(data, Date == "1/2/2007" | Date =="2/2/2007")

data.sub$Global_active_power <- as.numeric(data.sub$Global_active_power)

data.sub.test <- paste(data.sub$Date, data.sub$Time, sep=" ")

data.sub$Time <- strptime(data.sub.test, "%d/%m/%Y %H:%M:%S")

png(file="plot2.png", width=480, height=480)

plot(data.sub$Time, data.sub$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()