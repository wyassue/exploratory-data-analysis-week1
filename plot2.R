hpc <- read.table("household_power_consumption.txt", sep=",", header=TRUE, na.strings="?")
dataset = subset(hpc,Date %in% c("1/2/2007","2/2/2007")) 
dataset <- within (dataset, DateTime <- strptime (paste (dataset$Date, dataset$Time), '%d/%m/%Y %T'))

png(filename="plot2.png",
    width = 480, height = 480, 
    units = "px", pointsize = 12,
    bg = "white",  res = NA
)

plot(
  x = dataset$DateTime,
  y = dataset$Global_active_power,
  type = 'l',
  xlab = "", ylab = "Global Active Power (kilowatts)"
)

dev.off()