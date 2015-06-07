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

#Line plot with a range of columns combined in the same axis
plot(range(data2$datetime,na.rm=T),range(c(data2$Sub_metering_1,data2$Sub_metering_2,data2$Sub_metering_3)),na.rm=T,type="n",xlab="",ylab="Energy sub metering")

lines(data2$datetime,data2$Sub_metering_1,col="black")
lines(data2$datetime,data2$Sub_metering_2,col="red")
lines(data2$datetime,data2$Sub_metering_3,col="blue")

#Adding Legend 
legend("topright",lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Copy to file
dev.copy(png,file='plot3.png',width = 480, height = 480)
dev.off()

