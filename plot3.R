## File:    plot3.R
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
## Begin plot 3
png(file="plot3.png",width=480,height=480)
WorkingData <- mutate(WorkingData,DateTime = (paste(Date,Time,sep=" ")))
with(WorkingData,
     plot(strptime(WorkingData$DateTime,"%d/%m/%Y %H:%M:%S")
          ,WorkingData$Sub_metering_1,type="l"
          ,xlab="",ylab = "Energy sub metering ")
     ,ylim=c(0,10,20,30)
)
lines(strptime(WorkingData$DateTime,"%d/%m/%Y %H:%M:%S"),WorkingData$Sub_metering_2,type="l",col="red")
lines(strptime(WorkingData$DateTime,"%d/%m/%Y %H:%M:%S"),WorkingData$Sub_metering_3,type="l",col="blue")
legend("topright", pch="-",lty=1
       ,col=c("black","red","blue")
       ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)
dev.off()
## End plot 3
setwd(PreviousWorkingDirectory)