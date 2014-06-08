########################################################################
# Create histogram of the Global Active Power 
########################################################################

# Load household power consumption file
# Missing values are coded as ?
data<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

# Transform Date field into Date class
data$Date<-as.Date(data$Date,format='%d/%m/%Y')

# Create list of 2 dates used for to create the graph : 2007-02-01 and 2007-02-02
dateList<-c(as.Date("2007-02-01"), as.Date("2007-02-02"))

# Create dataset containing only the information for the specified list of 2 dates
dataSubset<-data[data$Date %in% dateList,]

# Open device to create PNG file
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "transparent",  res = NA)

# Create histrogram 
hist(dataSubset$Global_active_power, col=c("red"), 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close device
dev.off()