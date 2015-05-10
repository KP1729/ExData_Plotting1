if (!file.exists("./household_power_consumption.txt")) {
        fileURL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
        download.file(fileURL, destfile="./household_power_consumption.zip")
        unzip("./household_power_consumption.zip")
}

elecpwr <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
elecpwr2 <- elecpwr[elecpwr$Date == "1/2/2007" | elecpwr$Date == "2/2/2007",]
elecpwr2$DateTime <- as.POSIXct(strptime(paste(elecpwr2$Date, elecpwr2$Time), format='%d/%m/%Y %H:%M:%S'))

with(elecpwr2, {
                plot(DateTime,Sub_metering_1, type="l", ylab="Energy Sub metering")
                lines(DateTime, Sub_metering_2, type="l", col="red")
                lines(DateTime, Sub_metering_3, type="l", col="blue")
                legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                       col=c("black", "red","blue"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5))
                }
        )

dev.copy(png,file="./plot3.png")
dev.off()

