##before running the script install the read.table package if you haven't done that yet.
## install.packages ("read.table")
## library(read.table)
##set your working directory to where you've stored the data
##read in the full data set and select only the rows of the dates of 1st and 2nd of February 2007.
alldata<-read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE)
twodayfebdata<-alldata[alldata$Date %in% c("1/2/2007","2/2/2007"),]

##use the str() function to see if there are still values of ? present in the data.
str(twodayfebdata)

##make the Global_active_power variable numeric
twodayfebdata$Global_active_power<-as.numeric(twodayfebdata$Global_active_power)

##make the histogram according to the example and save it in a png file. Because by default the unit is already pixels it's not specified.
png(filename="plot1.png", width=480, height=480)
hist(twodayfebdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
