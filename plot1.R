# Project - Exploratory Graphs and Data analysis
# Read the Data to plot [Individual household electric power consumption Data Set ]

dataEPC<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")

# Convert the date field to make use of subsetting easily

dataEPC$Date<-as.Date(dataEPC$Date, format="%d/%m/%Y")

# Subset the data to get the data from 1/2/2007 to 2/2/2007

subdataEPC<-subset(dataEPC, subset=(Date>="2007-02-01" & Date<="2007-02-02"))
rm(dataEPC)

# Getting the date time column 
datetime <- paste(subdataEPC$Date, subdataEPC$Time)
subdataEPC$DateTime<-as.POSIXct(datetime)

# PLOT-1
hist(subdataEPC$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

#Saving to file plot1.png
dev.copy(png, file = "plot1.png", height=480, width=480)
dev.off()





