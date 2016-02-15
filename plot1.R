hpc <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data = subset(hpc,Date %in% c("1/2/2007","2/2/2007")) 

png(filename="plot1.png",
  width = 480, height = 480
)

hist(
  x=data$Global_active_power, 
  col="red", main="Global Active Power",
  xlab="Global Active Power (kilowatts)"
)

dev.off()

