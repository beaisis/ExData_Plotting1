#Read Datafile
dataFile    <- "./data/exdata-data-household_power_consumption/household_power_consumption.txt"
dataTable   <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset for years of interest
SubSetData        <- dataTable[data$Date %in% c("1/2/2007","2/2/2007") ,]

# create single datetime variable in useful format
SubSetDateTime    <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# convert to numerics for plotting
GlobalActivePower     <- as.numeric(SubSetData$Global_active_power)
GlobalReactivePower   <- as.numeric(SubSetData$Global_reactive_power)
voltage               <- as.numeric(SubSetData$Voltage)
SubMetering_1         <- as.numeric(SubSetData$Sub_metering_1)
SubMetering_2         <- as.numeric(SubSetData$Sub_metering_2)
SubMetering_3         <- as.numeric(SubSetData$Sub_metering_3)

# Set output png
png("plot4.png", width=480, height=480)

# set up canvas out 
par(mfrow = c(2, 2)) 


#Plot1
plot(SubSetDateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Plot2 
plot(SubSetDateTime, voltage, type="l", xlab="DateTime", ylab="Voltage")

#Plot 3
plot (SubSetDateTime, SubMetering_1, type="l", ylab="Energy sub metering", xlab="")
lines(SubSetDateTime, SubMetering_2, type="l", col="red")
lines(SubSetDateTime, SubMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, col=c("black", "red", "blue"), bty="n")


#Plot 4
plot(SubSetDateTime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()