fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./household_power_consumption.zip", method="curl")

unzip("household_power_consumption.zip")

data <- read.csv("household_power_consumption.txt", sep=";", colClasses="character")

data.sub <- subset(data, Date == "1/2/2007" | Date =="2/2/2007")

data.sub$Global_active_power <- as.numeric(data.sub$Global_active_power)

hist(data.sub$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")