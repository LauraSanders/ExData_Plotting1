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

##use the str() function to take a look at the data. Because in the two requested dates no missing data is present (as shown by ?)
## no action is undertaken to strip these from the data.
str(twodayfebdata)

##make the Global_active_power variable numeric
twodayfebdata$Global_active_power<-as.numeric(twodayfebdata$Global_active_power)

##make the histogram according to the example and save it in a png file. Because by default the unit is already pixels it's not specified.
png(filename="plot1.png", width=480, height=480)
hist(twodayfebdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
