#Plot1
library(dplyr)
library(lubridate)
dataset<-tbl_df(read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE))
dataset$Date<-dmy(dataset$Date)
#subsets the dates of interest
subset_data<-filter(dataset, Date == "2007-02-01" | Date == "2007-02-02")
str(subset_data)
#converts the Global_Active_power variable to numeric format and produces a histogram
GAP<-as.numeric(subset_data$Global_active_power)
#plot1
png("plot1.png", width = 480, height = 480)
hist(GAP, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
    

