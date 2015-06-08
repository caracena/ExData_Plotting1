
# read file
data <- read.csv("household_power_consumption.txt", sep=";")

# read dates
data$Date2 <- as.Date(strptime(data$Date,"%e/%m/%Y"),"%d/%m/%Y")

# filter by dates
subData <- subset(data, Date2 >= as.Date("2007/02/01") & Date2 <= as.Date("2007/02/02"))

#create time
subData$Time2 <- strptime(paste(subData$Date2,subData$Time, sep = " "),"%Y-%m-%d %H:%M:%S")

#plot
plot(subData$Time2, as.numeric(subData$Global_active_power)/1000, pch = "l", ylab="Global Active Power (kilowatts)", xlab = "")
lines(subData$Time2,as.numeric(subData$Global_active_power)/1000,lwd=1)

# save png
dev.copy(png,'plot2.png')
dev.off()