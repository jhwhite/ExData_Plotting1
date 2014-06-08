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

# opens the png file naming the plot file plot1.png and giving the dimensions
png(file="plot1.png", width=480, height=480)

# plots the histogram with a title of Global Active Power, coloring the histogram red, and giving the x axis a label
hist(data.sub$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

# closes the file
dev.off()