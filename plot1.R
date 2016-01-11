
# Download the File
if (!file.exists("data")) {
        dir.create("data") # create folder
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/eletric.zip")
unzip("./data/eletric.zip")

# Read the file
power<-read.csv("household_power_consumption.txt",sep=";",na.strings=c("?"),header = T)

# Convert the variable Date To Date
power$Date<-as.Date(power$Date,"%d/%m/%Y")

# Subset
data1<-power[power$Date ="2007-02-01" | power$Date ="2007-02-02",]

#Plot
png("plot1.png")
hist(data1$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
