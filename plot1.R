## File:    plot1.R
## Date:    01-10-2016
## Author:  bartvdt
## Version: 1
##
library(dplyr)
PreviousWorkingDirectory <- getwd()
WorkingDirectory <- getwd()
WorkingDirectory <- paste(WorkingDirectory,"/Exploratory Data Analysis",sep="")
setwd(WorkingDirectory)
GrossData <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
WorkingData <- filter(GrossData,Date=="1/2/2007"  | Date=="2/2/2007" )
rm(GrossData)
## Begin plot 1
png(file="plot1.png",width=480,height=480)
hist(as.numeric(WorkingData$Global_active_power)
     ,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
## End plot 1
setwd(PreviousWorkingDirectory)