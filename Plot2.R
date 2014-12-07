##before running the script install the read.table package if you haven't done that yet.
## install.packages ("read.table")
## library(read.table)
##set your working directory to where you've stored the data (if you skip the download of the data and the unzip command) or where you want to store the data.
##download the data and unzip it.
Downloadeddata<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(Downloadeddata, destfile=".\\exdata_data_household_power_consumption.zip")
unzip("exdata_data_household_power_consumption.zip")

##read in the full data set and select only the rows of the dates of 1st and 2nd of February 2007.
alldata<-read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE)
twodayfebdata<-alldata[alldata$Date %in% c("1/2/2007","2/2/2007"),]

##use the str() function to see if there are still values of ? present in the data.
str(twodayfebdata)

##make the Global_active_power variable numeric
twodayfebdata$Global_active_power<-as.numeric(twodayfebdata$Global_active_power)

## set the dates in the correct format
twodayfebdata$datetime <- strptime(paste(twodayfebdata$Date, twodayfebdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##make the plot according to the example and save it in a png file. Because by default the unit is already pixels it's not specified.
png(filename="plot2.png", width=480, height=480)
plot(twodayfebdata$datetime,twodayfebdata$Global_active_power,xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()


