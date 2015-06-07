
# read file
data <- read.csv("household_power_consumption.txt", sep=";")

# read dates
data$Date2 <- as.Date(strptime(data$Date,"%e/%m/%Y"),"%d/%m/%Y")

# filter by dates
subData <- subset(data, Date2 >= as.Date("2007/02/01") & Date2 <= as.Date("2007/02/02"))

# histogram
hist(as.numeric(subData$Global_active_power)/1000, breaks = 12,  main="Gloabal Active Numeric", xlab="Global Active Power (kilowatts)", col = "orangered")

# save png
dev.copy(png,'plot1.png')
dev.off()