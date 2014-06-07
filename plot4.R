# Load dataset

setwd("~/Projekte/R_Kurs/exdata-data-household_power_consumption")
hpc <- read.table("household_power_consumption.txt",header=T,nrows=100,sep=";")  #load 100 lines

classes <- sapply(hpc,class)       # save classes of columns in variable
hpc <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=classes,na.strings="?")  # load whole dataset

hpc$Date <- as.Date(as.character(hpc$Date),"%d/%m/%Y")           # convert Date
hpc$Time <- strptime(as.character(hpc$Time),format="%H:%M:%S")   # convert time
hpc <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02",] # selecting the 2 days only



# Creating Plot 4
dummy <- 1:2880     # using this instead of the Time variable for plotting and axis labeling

par(mfrow=c(2,2))

# first plot
plot(dummy,hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",xaxt = "n")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))


# second plot

plot(dummy,hpc$Voltage,type="l",xlab="",ylab="Voltage",xaxt = "n")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))

# third plot

plot(dummy,hpc$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",xaxt = "n")
points(dummy,hpc$Sub_metering_2,type="l",col="red")
points(dummy,hpc$Sub_metering_3,type="l",col="blue")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lwd=2,lty=1,cex=0.7,bty="n")

# fourth plot

with(hpc,plot(dummy,Global_reactive_power,type="l",xlab="",xaxt = "n"))
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))

# Saving plot

dev.copy(png,"plot4.png")
dev.off()
