data <- "household_power_consumption.txt"
stuff <- read.table(data,header=TRUE,sep=";",stringsAsFactors = FALSE, dec=".")
stuffDate <- stuff$Date
subSetStuff <- stuff[stuffDate %in% c("1/2/2007","2/2/2007"), ]
subsetDate <- subSetStuff$Date
subsetTime <- subSetStuff$Time
TimenDate <- strptime(paste(subsetDate,subsetTime,sep=" "), "%d/%m/%Y  %H:%M:%S")
SubGlobal <- subSetStuff$Global_active_power
globalPower <- as.numeric(SubGlobal)

Sub1 <- as.numeric(subSetStuff$Sub_metering_1)
Sub2 <- as.numeric(subSetStuff$Sub_metering_2)
Sub3 <- as.numeric(subSetStuff$Sub_metering_3)

png("plot3.png",width=480,height=480)
plot(TimenDate,Sub1, type="l",xlab="", ylab="Energy Sub-metering")
lines(TimenDate,Sub2, type="l", col="red")
lines(TimenDate,Sub3, type="l", col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,lwd=2.5,col = c("black","red","blue"))

dev.off()