
if (!file.exists("./household_power_consumption.txt")) {
        fileURL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
        download.file(fileURL, destfile="./household_power_consumption.zip")
        unzip("./household_power_consumption.zip")
}

elecpwr <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
elecpwr2 <- elecpwr[elecpwr$Date == "1/2/2007" | elecpwr$Date == "2/2/2007",]
elecpwr2$DateTime <- as.POSIXct(strptime(paste(elecpwr2$Date, elecpwr2$Time), format='%d/%m/%Y %H:%M:%S'))

plot(elecpwr2$DateTime,elecpwr2$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.copy(png,file="./plot2.png")
dev.off()

