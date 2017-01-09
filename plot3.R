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

# PLOT-3
#with(subdataEPC, plot( type = "n"))
with(subdataEPC,
     {plot(Sub_metering_1~DateTime,type="l",xlab = "", ylab = "Energy sub metering")
      lines(Sub_metering_2~DateTime,col="red")
      lines(Sub_metering_3~DateTime,col="blue")}
    )
legend("topright", lty = 1,lwd = 2, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Saving to file plot1.png
dev.copy(png, file = "plot3.png", height=480, width=480)
dev.off()