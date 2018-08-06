data <- "household_power_consumption.txt"
stuff <- read.table(data,header=TRUE,sep=";",stringsAsFactors = FALSE, dec=".")
stuffDate <- stuff$Date
subSetStuff <- stuff[stuffDate %in% c("1/2/2007","2/2/2007"), ]
SubGlobal <- subSetStuff$Global_active_power
globalPower <- as.numeric(SubGlobal)
png("plot1.png",width=480,height=480)
hist(globalPower,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
