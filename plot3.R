# Load dataset

setwd("~/Projekte/R_Kurs/exdata-data-household_power_consumption")
hpc <- read.table("household_power_consumption.txt",header=T,nrows=100,sep=";")  #load 100 lines

classes <- sapply(hpc,class)       # save classes of columns in variable
hpc <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=classes,na.strings="?")  # load whole dataset

hpc$Date <- as.Date(as.character(hpc$Date),"%d/%m/%Y")           # convert Date
hpc$Time <- strptime(as.character(hpc$Time),format="%H:%M:%S")   # convert time
hpc <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02",] # selecting the 2 days only



# Creating Plot 3
dummy <- 1:2880     # using this instead of the Time variable for plotting and axis labeling
plot(dummy,hpc$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",xaxt = "n")
points(dummy,hpc$Sub_metering_2,type="l",col="red")
points(dummy,hpc$Sub_metering_3,type="l",col="blue")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lwd=2,lty=1,cex=0.5)

# Saving plot

dev.copy(png,"plot3.png")
dev.off()
