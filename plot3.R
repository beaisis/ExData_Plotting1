#Read Datafile
dataFile    <- "./data/exdata-data-household_power_consumption/household_power_consumption.txt"
dataTable   <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset for years of interest
SubSetData        <- dataTable[data$Date %in% c("1/2/2007","2/2/2007") ,]

# create single datetime variable in useful format
SubSetdatetime    <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# convert to numerics for plotting
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)
SubMetering_1     <- as.numeric(SubSetData$Sub_metering_1)
SubMetering_2     <- as.numeric(SubSetData$Sub_metering_2)
SubMetering_3     <- as.numeric(SubSetData$Sub_metering_3)


# Set output png
png("plot3.png", width=480, height=480)

#Plot 
plot (SubSetdatetime, SubMetering_1, type="l", ylab="Energy sub metering", xlab="")
lines(SubSetdatetime, SubMetering_2, type="l", col="RED")
lines(SubSetdatetime, SubMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Close PNG
dev.off()
  