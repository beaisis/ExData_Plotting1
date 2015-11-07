#Read Datafile
dataFile    <- "./data/exdata-data-household_power_consumption/household_power_consumption.txt"
dataTable   <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset for years of interest
SubSetData        <- dataTable[data$Date %in% c("1/2/2007","2/2/2007") ,]

# create single datetime variable in useful format
SubSetDateTime    <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# convert to numerics for plotting
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)

# Set output png
png("plot2.png", width=480, height=480)

#Plot 
plot(SubSetDateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (Kilowatts)")

#Close PNG
dev.off()
  