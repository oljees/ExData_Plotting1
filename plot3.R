##Exploratory Data Analysis Assignment 1

#Download data
setwd("C:\\coursera\\ExploratoryDataAnalysis\\assignment1")
dataurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(dataurl,destfile = "data.zip")
datedownload<-Sys.Date()

hpc<-read.table(unzip("data.zip",files="household_power_consumption.txt"),
                sep=";",header=T,nrows=2100000,na.strings="?")
head(hpc)

#convert date and time to datetime posixlt
hpc$datetime<-paste(hpc$Date,hpc$Time,sep=" ")
head(hpc$datetime)
hpc$datetime<-strptime(hpc$datetime,"%d/%m/%Y %H:%M:%S")
head(hpc$datetime)
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")

#subset for 2007-02-01 and 2007-02-02 only
subset<-subset(hpc,Date=="2007-02-01" | Date=="2007-02-02")

#plot3
png(file="plot3.png")
plot(subset$datetime,subset$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")
lines(subset$datetime,subset$Sub_metering_2,
      col="red")
lines(subset$datetime,subset$Sub_metering_3,
      col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1),col=c("black","red","blue"))

dev.off()