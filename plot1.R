dataSet <- read.csv("/users/michaelpearlman/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataSet$Date <- as.Date(dataSet$Date, format="%d/%m/%Y")

##subset the data
subSetData <- subset(dataSet, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataSet)

## Convert the Dates
dateTime <- paste(as.Date(subSetData$Date), subSetData$Time)
subSetData$Datetime <- as.POSIXct(dateTime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save to PNG
dev.copy(png, file = "/users/michaelpearlman/plot1.png")
dev.off()