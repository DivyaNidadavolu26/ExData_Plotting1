data <- "household_power_consumption.txt"
stuff <- read.table(data,header=TRUE,sep=";",stringsAsFactors = FALSE, dec=".")
stuffDate <- stuff$Date
subSetStuff <- stuff[stuffDate %in% c("1/2/2007","2/2/2007"), ]
subsetDate <- subSetStuff$Date
subsetTime <- subSetStuff$Time
TimenDate <- strptime(paste(subsetDate,subsetTime,sep=" "), "%d/%m/%Y  %H:%M:%S")
SubGlobal <- subSetStuff$Global_active_power
globalPower <- as.numeric(SubGlobal)
png("plot2.png",width=480,height=480)
plot(TimenDate,globalPower,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()