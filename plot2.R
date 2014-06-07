# Load dataset

setwd("~/Projekte/R_Kurs/exdata-data-household_power_consumption")
hpc <- read.table("household_power_consumption.txt",header=T,nrows=100,sep=";")  #load 100 lines

classes <- sapply(hpc,class)       # save classes of columns in variable
hpc <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=classes,na.strings="?")  # load whole dataset

hpc$Date <- as.Date(as.character(hpc$Date),"%d/%m/%Y")           # convert Date
hpc$Time <- strptime(as.character(hpc$Time),format="%H:%M:%S")   # convert time
hpc <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02",] # selecting the 2 days only



# Creating Plot 2
dummy <- 1:2880     # using this instead of the Time variable for plotting and axis labeling
plot(dummy,hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",xaxt = "n")
axis(1, at=c(1,1440,2880), labels=c("Thu","Fri","Sat"))


# Saving plot

dev.copy(png,"plot2.png")
dev.off()
