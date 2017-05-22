#Plot2
library(dplyr)
library(lubridate)
dataset<-tbl_df(read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE))
dataset$Date<-dmy(dataset$Date)
#subsets the dates of interest
subset_data<-filter(dataset, Date == "2007-02-01" | Date == "2007-02-02")
#combines the date and time variables
date_time <-paste(subset_data$Date, subset_data$Time, sep=" ")
subset_data$date_time<-as.POSIXct(date_time)
GAP <- as.numeric(subset_data$Global_active_power)
#plot2
png("plot2.png", width=480, height=480)
plot(GAP~subset_data$date_time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
