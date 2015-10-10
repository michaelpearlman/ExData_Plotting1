dataSet <- read.csv("/users/michaelpearlman/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataSet$Date <- as.Date(dataSet$Date, format="%d/%m/%Y")

## Subsetting the data
subSetdata <- subset(dataSet, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataSet)

## Converting dates
dateTime <- paste(as.Date(subSetdata$Date), subSetdata$Time)
subSetdata$Datetime <- as.POSIXct(dateTime)

## Plot 2
plot(subSetdata$Global_active_power~subSetdata$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()