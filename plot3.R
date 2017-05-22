#Plot3
library(dplyr)
library(lubridate)
dataset<-tbl_df(read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE))
dataset$Date<-dmy(dataset$Date)
#subsets the dates of interest
subset_data<-filter(dataset, Date == "2007-02-01" | Date == "2007-02-02")
#combines the date and time variables
date_time <-paste(subset_data$Date, subset_data$Time, sep=" ")
subset_data$date_time<-as.POSIXct(date_time)
#plot3
png("plot3.png", width=480, height=480)
with(subset_data, {
        plot(Sub_metering_1~date_time, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~date_time, col='red')
        lines(Sub_metering_3~date_time, col='blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
