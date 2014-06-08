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
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "transparent",  res = NA)

# Create plot of Submetering 1 in time 
# Fix y limits to ensure that all 3 curves use lthe same limits
plot(dataSubset$Date_Time, dataSubset$Sub_metering_1, type="l", 
     col=c("black"), ylim=c(0,38),
     ylab="Global Active Power (kilowatts)", xlab="", main="")

par(new=T)

# Create plot of Submetering 2 in time 
# Fix y limits to ensure that all 3 curves use lthe same limits
plot(dataSubset$Date_Time, dataSubset$Sub_metering_2, type="l", col=c("red"),
     ylim=c(0,38), ylab="", xlab="", main="")

par(new=T)

# Create plot of Submetering 3 in time 
# Fix y limits to ensure that all 3 curves use lthe same limits
plot(dataSubset$Date_Time, dataSubset$Sub_metering_3, type="l", col=c("blue"),
     ylim=c(0,38), ylab="", xlab="", main="")

# Add legend
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), 
        lwd=c(2.5,2.5),col=c("black","red", "blue"))

# Close device
dev.off()
