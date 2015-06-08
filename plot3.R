
# read file
data <- read.csv("household_power_consumption.txt", sep=";")

# read dates
data$Date2 <- as.Date(strptime(data$Date,"%e/%m/%Y"),"%d/%m/%Y")

# filter by dates
subData <- subset(data, Date2 >= as.Date("2007/02/01") & Date2 <= as.Date("2007/02/02"))

#create time
subData$Time2 <- strptime(paste(subData$Date2,subData$Time, sep = " "),"%Y-%m-%d %H:%M:%S")

#plot
plot(subData$Time2, as.numeric(subData$Sub_metering_1), type = "n", ylab="Energy sub metering", xlab = "")
lines(subData$Time2,as.numeric(subData$Sub_metering_1),lwd=1, col ="black" )
lines(subData$Time2,as.numeric(subData$Sub_metering_2),lwd=1, col ="red" )
lines(subData$Time2,as.numeric(subData$Sub_metering_3),lwd=1, col ="blue" )

# save png
dev.copy(png,'plot3.png')
dev.off()