
if (!file.exists("./household_power_consumption.txt")) {
        fileURL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
        download.file(fileURL, destfile="./household_power_consumption.zip")
        unzip("./household_power_consumption.zip")
}

elecpwr <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
elecpwr2 <- elecpwr[elecpwr$Date == "1/2/2007" | elecpwr$Date == "2/2/2007",]

hist(elecpwr2$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power",
     col="red")

dev.copy(png, file="./plot1.png")
dev.off()