#Read Datafile
dataFile    <- "./data/exdata-data-household_power_consumption/household_power_consumption.txt"
dataTable   <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# subset for years of interest
SubSetData        <- data[dataTable$Date %in% c("1/2/2007","2/2/2007") ,]

# convert to numerics for plotting
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)

# Set output png
png("plot1.png", width=480, height=480)

# Histogram Plot
hist(GlobalActivePower, col="RED", main="Global Active Power", xlab="Global Active Power (Kilowatts)")

#Close PNG
dev.off()
