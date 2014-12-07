##before running the script install the read.table package if you haven't done that yet.
## install.packages ("read.table")
## library(read.table)
##set your working directory to where you've stored the data
##read in the full data set and select only the rows of the dates of 1st and 2nd of February 2007.
alldata<-read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE)
twodayfebdata<-alldata[alldata$Date %in% c("1/2/2007","2/2/2007"),]

##use the str() function to see if there are still values of ? present in the data.
str(twodayfebdata)

##make the energy sub metering variables numeric
twodayfebdata$Sub_metering_1<-as.numeric(twodayfebdata$Sub_metering_1)
twodayfebdata$Sub_metering_2<-as.numeric(twodayfebdata$Sub_metering_2)
twodayfebdata$Sub_metering_3<-as.numeric(twodayfebdata$Sub_metering_3)

## set the dates in the correct format
twodayfebdata$datetime <- strptime(paste(twodayfebdata$Date, twodayfebdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##make the plot according to the example and save it in a png file. Because by default the unit is already pixels it's not specified.
png(filename="plot3.png", width=480, height=480)
plot(twodayfebdata$datetime,twodayfebdata$Sub_metering_1,xlab="", ylab="Energy sub metering", type="l")
lines(twodayfebdata$datetime,twodayfebdata$Sub_metering_2,type="l", col="red")
lines(twodayfebdata$datetime,twodayfebdata$Sub_metering_3,type="l", col="blue")
legend("topright", lty=1 ,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
