## File:    plot2.R
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
## Begin plot 2
png(file="plot2.png",width=480,height=480)
WorkingData <- mutate(WorkingData,DateTime = (paste(Date,Time,sep=" ")))
with(WorkingData,
     plot(strptime(WorkingData$DateTime,"%d/%m/%Y %H:%M:%S")
          ,WorkingData$Global_active_power,type="l"
          ,xlab="",ylab = "Global Active Power (kilowatts)")
)
dev.off()
## End plot 2
setwd(PreviousWorkingDirectory)