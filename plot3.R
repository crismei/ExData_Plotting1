
# Download the File
if (!file.exists("data")) {
        dir.create("data") # create folder
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/eletric.zip")
unzip("./data/eletric.zip")

# Read the file
power<-read.csv("household_power_consumption.txt",sep=";",na.strings=c("?"),header = T,stringsAsFactors = F)

# Convert the variable Date To Date
power$Date<-as.Date(power$Date,"%d/%m/%Y")


# Subset
data1<-power[power$Date =="2007-02-01" | power$Date =="2007-02-02",]

subSetData<-power[power$Date =="2007-02-01" | power$Date =="2007-02-02",]
# To transform the locale time in English


data1$Datetime<-strptime(paste(data1$Date, data1$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

Sys.setlocale("LC_TIME", "English")

#Plot
png("plot3.png")
plot(data1$Datetime,data1$Sub_metering_1, xlab="", ylab="Energy sub metering",ylim=range(data1[c("Sub_metering_1","Sub_metering_2","Sub_metering_3")]),type="l",col="black")
lines(data1$Datetime,data1$Sub_metering_2,type="l",col="red")
lines(data1$Datetime,data1$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

dev.off()
