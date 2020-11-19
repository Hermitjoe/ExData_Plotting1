## Code for plot 3 (sub metering line Plots) of the homework for week 1 
## Note: Date and time merge taken from Stack Overflow: https://stackoverflow.com/questions/11609252/r-tick-data-merging-date-and-time-into-a-single-object


## Import the file Information using fread
## <ore on FREAD here: https://www.infoworld.com/article/3566384/5-handy-options-in-r-datatables-fread.html\
elecd <- data.table::fread("./household_power_consumption.txt")                  ## Create data holder
ed <- elecd[elecd$Date == "1/2/2007" | elecd$Date == "2/2/2007",]                ## Reduce to desired dates  

ed$Date <- as.Date(ed$Date, format= "%d/%m/%Y")                                  ## Format dates
ed$DateTime <- as.POSIXct(paste(ed$Date, ed$Time), format="%Y-%m-%d %H:%M:%S")   ## Add new var for Date time 

## Set a 2 by 2 grid to display the plots
par(mfrow = c(2, 2))

## plot 1,1 - Plot from plot2.R script
plot(ed$DateTime, as.numeric(ed$Global_active_power), xlab= "", ylab = "Global Active Power (Kilowatts)", type ="n")
lines(ed$DateTime, as.numeric(ed$Global_active_power))                           ## Add line to blank plot

## plot 1,2 - Datetime x voltage plot
plot(ed$DateTime, as.numeric(ed$Voltage), xlab= "datetime", ylab = "Voltage", type ="n")
lines(ed$DateTime, as.numeric(ed$Voltage))                                       ## Add line to blank plot

## plot 2,1 - PLot from plot3.R
plot(ed$DateTime, ed$Sub_metering_1, xlab= "", ylab = "Energy Sub Metering", type ="n")
with(ed, {
  lines(DateTime, Sub_metering_1, col = "Red")
  lines(DateTime, Sub_metering_2, col = "Green")
  lines(DateTime, Sub_metering_3, col = "Blue")
})

## PLot 2,2 - Datetime x Reactive power 
plot(ed$DateTime, as.numeric(ed$Global_reactive_power), xlab= "datetime", ylab = "Global_reactive_power", type ="n")
lines(ed$DateTime, as.numeric(ed$Global_reactive_power))                           ## Add line to blank plot


##Note: I am colorblind, so the color may be off 

## Put the plot into a file
dev.copy(png, file= 'plot4.png')                     # Copy displayed plot to a file
dev.off()                                            # Close File to make it available