# put download URL into variable fileURL
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# downloads the file using curl since using https
download.file(fileUrl, destfile="./household_power_consumption.zip", method="curl")

# unzips the downloaded file, if the file already exists will overwrite
unzip("household_power_consumption.zip", overwrite=TRUE)

# reads the ';' separated data in, converts columns to character, stores in variable called data
data <- read.csv("household_power_consumption.txt", sep=";", colClasses="character")

# subsets data based on the dates we're using
data.sub <- subset(data, Date == "1/2/2007" | Date =="2/2/2007")

# converts the columns Global_active_power to a numeric class
data.sub$Global_active_power <- as.numeric(data.sub$Global_active_power)

# pastes the columsn Date and Time together separated by a space, and stores into data.sub.test variable
data.sub.test <- paste(data.sub$Date, data.sub$Time, sep=" ")

# converts the date time field in data.sub.test and stores it back in Time column
# this could have been a new column, or overwritten Date, decided to reuse Time column
data.sub$Time <- strptime(data.sub.test, "%d/%m/%Y %H:%M:%S")

# opens the png file naming the plot file plot1.png and giving the dimensions
png(file="plot4.png", width=480, height=480)

# creates a canvas for graphs for 2 columns and 2 rows of plots
par(mfrow=c(2, 2))

# plots a line graph with x axis of Time column (this has the Date and Time) and y axis of 
# Global_active_power. No x axis label. y axis label is given as Gloval Active Power (kilowatts)
plot(data.sub$Time, data.sub$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# plots out the time along the x axis and the voltage column along the way
plot(data.sub$Time, data.sub$Voltage, type="l", ylab="Voltage", xlab="datetime")

# # adds three plots to the graph
plot(data.sub$Time, data.sub$Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xlab="")
points(data.sub$Time, data.sub$Sub_metering_2, type="l", col="red")
points(data.sub$Time, data.sub$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1), fill="white", border="white", bty="n", col=c("black", "red", "blue"), legend=c("Sub_meter_1", "Sub_meter_2", "Sub_Meter_3"))

# plots Time along x axis and Global_reactive_power along y
plot(data.sub$Time, data.sub$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

# closes the file
dev.off()