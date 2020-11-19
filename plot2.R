## Code for plot 2 (line Plot) of the homework for week 1 
## Note: Date and time merge taken from Stack Overflow: https://stackoverflow.com/questions/11609252/r-tick-data-merging-date-and-time-into-a-single-object


## Import the file Information using fread
## <ore on FREAD here: https://www.infoworld.com/article/3566384/5-handy-options-in-r-datatables-fread.html\
elecd <- data.table::fread("./household_power_consumption.txt")                  ## Create data holder
ed <- elecd[elecd$Date == "1/2/2007" | elecd$Date == "2/2/2007",]                ## Reduce to desired dates  

ed$Date <- as.Date(ed$Date, format= "%d/%m/%Y")                                  ## Format dates
ed$DateTime <- as.POSIXct(paste(ed$Date, ed$Time), format="%Y-%m-%d %H:%M:%S")   ## Add new var for Date time 

## Display Histogram
par(mar = c(6,6,3,3))                                                            ## Set Margins 
plot(ed$DateTime, as.numeric(ed$Global_active_power), xlab= "", ylab = "Global Active Power (Kilowatts)", type ="n")
lines(ed$DateTime, as.numeric(ed$Global_active_power))                           ## Add line to blank plot

##Note: I am colorblind, so the color may be off 

## Put the plot into a file
dev.copy(png, file= 'plot2.png')                     # Copy displayed plot to a file
dev.off()                                            # Close File to make it available