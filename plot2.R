########################################################################
# Create histogram of the Global Active Power 
########################################################################

# Load household power consumption file
# Missing values are coded as ?
data<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

# Paste Date and Time to create a Time class column
data$Date_Time<-strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')

# Transform Date field into Date class
data$Date<-as.Date(data$Date,format='%d/%m/%Y')

# Create list of 2 dates used for to create the graph : 2007-02-01 and 2007-02-02
dateList<-c(as.Date("2007-02-01"), as.Date("2007-02-02"))


# Create dataset containing only the information for the specified list of 2 dates
dataSubset<-data[data$Date %in% dateList,]

# Open device to create PNG file
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "transparent",  res = NA)

# Create plot of Global Active Power in time 
plot(dataSubset$Date_Time, dataSubset$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="", main="")

# Close device
dev.off()

