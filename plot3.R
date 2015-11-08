## DATA SCIENCE TRACK  -- JHU + COURSERA
# RAFAEL SILVEIRA @SILVEIR4F

# PREAMBLE -- PACKAGES
library(lubridate)

# SETTING WORKING DIRECTORY
setwd("C:/R/exdata-data-household_power_consumption/")

# READING DATA INTO A DATA FRAME "power"
power <- read.table("household_power_consumption.txt", sep=";", dec=".", header=TRUE, na.strings = "?")

# SUBSETING DATA TO DATES: 1/2/2007 or 2/2/2007
power <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")

# CREATING A NEW VARIABLE "DateTime" USING LUBRIDATE PACKAGE
power$DateTime <- dmy_hms(paste(power$Date," ",power$Time))

## PLOTTING AND SAVING FILE IN THE WORKING DIRECTORY

    # PLOT 3
plot(Sub_metering_1 ~ DateTime, data = power, type = "l", ylab = "Energy sub metering", xlab="")
lines(power$DateTime, power$Sub_metering_2, col = "red")
lines(power$DateTime, power$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5), col=c("black","red","blue"))

        # Creating png file in Working Directory
        dev.copy(png,'plot3.png', width = 480, height = 480)
        dev.off()
