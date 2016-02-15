hpc <- read.table("household_power_consumption.txt", sep=",", header=TRUE, na.strings="?")
dataset <- within (hpc, DateTime <- strptime (paste (hpc$Date, hpc$Time), '%d/%m/%Y %T'))
dataset = subset(dataset,Date %in% c("1/2/2007","2/2/2007")) 

png(filename="plot3.png",
    width = 480, height = 480, 
    units = "px", pointsize = 12,
    bg = "white",  res = NA
)

plot(
  x=dataset$DateTime,
  y=as.numeric(dataset$Sub_metering_1),
  type = 'l', col="black",
  xlab = NA, ylab = 'Energy sub metering'
)

lines(
  x=dataset$DateTime,
  y=as.numeric(dataset$Sub_metering_2),
  col="red"
)

lines(
  x=dataset$DateTime,
  y=as.numeric(dataset$Sub_metering_3),
  col="blue"
)

legend(
  "topright", col=c("black","red", "blue"),lty = 1,
  legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)
dev.off()