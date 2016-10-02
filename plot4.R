## File:    plot4.R
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
## Begin plot 4
png(file="plot4.png",width=480,height=480)
par(mfrow = c(2,2),mar=c(4.1,4.1,2,2),oma=c(1,1,0,0))
WorkingData <- mutate(WorkingData,DateTime = (paste(Date,Time,sep=" ")))
with(WorkingData,
     {
         plot(strptime(WorkingData$DateTime,"%d/%m/%Y %H:%M:%S")
              ,WorkingData$Global_active_power,type="l"
              ,xlab="",ylab = "Global Active Power")
         
         plot(strptime(WorkingData$DateTime,"%d/%m/%Y %H:%M:%S")
              ,WorkingData$Voltage,type="l"
              ,xlab="datetime",ylab = "Voltage")
         ylim=c(234,238,242,246)
         plot(strptime(WorkingData$DateTime,"%d/%m/%Y %H:%M:%S")
              ,WorkingData$Sub_metering_1,type="l"
              ,xlab="",ylab = "Energy sub metering "
         )
         lines(strptime(WorkingData$DateTime,"%d/%m/%Y %H:%M:%S"),WorkingData$Sub_metering_2,type="l",col="red")
         lines(strptime(WorkingData$DateTime,"%d/%m/%Y %H:%M:%S"),WorkingData$Sub_metering_3,type="l",col="blue")
         legend("topright", pch="-", bty="n"
                ,col=c("black","red","blue")
                ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
         )
         plot(strptime(WorkingData$DateTime,"%d/%m/%Y %H:%M:%S")
              ,WorkingData$Global_reactive_power,type="l"
              ,xlab="datetime",ylab="Global_reactive_power"
         )
         ylim=c(0.0,0.1,0.2,0.3,0.4,0.5)
     })
dev.off()
## End plot 4
setwd(PreviousWorkingDirectory)