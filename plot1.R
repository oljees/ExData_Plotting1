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

#plot1
png(file="plot1.png")
hist(subset$Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()
