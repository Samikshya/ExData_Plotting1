#Data Load
data<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

#Conversion into Date format
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

#Subsetting of data for using data from the dates 2007-02-01 and 2007-02-02
data2<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")

#Setting Parameters for plot
par(mfrow=c(1,1))

#Plotting Histogram
with(data2,hist(Global_active_power,col='red',xlab='Global Active Power (kilowatts)',main='Global Active Power'))

#Copy to file
dev.copy(png,file='plot1.png',width = 480, height = 480)
dev.off()