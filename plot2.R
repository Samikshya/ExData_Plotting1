#Data Load
data<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

#Conversion into Date format
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

#Subsetting of data for using data from the dates 2007-02-01 and 2007-02-02
data2<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")

#Setting Parameters for plot
par(mfrow=c(1,1))

#Combining Date and Time and formatting to datetime
data2$datetime<-strptime(paste(data2$Date,data2$Time,sep=" "),format="%Y-%m-%d %H:%M:%S")

#Plotting line chart and Labelling axises
with(data2,plot(data2$datetime,Global_active_power,type="line",xlab="",ylab='Global Active Power (kilowatts)'))

#Copy to file
dev.copy(png,file='plot2.png',width = 480, height = 480)
dev.off()