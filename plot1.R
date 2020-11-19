## Plot File 1, 
## Import the electrical information from the household_power_consumption.txt file
##  Limit the information to just 2007-02-01 and 2007-02-02
## Produce a histogram of the Global Active power column


## Import the file Information using fread
## <ore on FREAD here: https://www.infoworld.com/article/3566384/5-handy-options-in-r-datatables-fread.html\
elecd <- data.table::fread("./household_power_consumption.txt")
ed <- elecd[elecd$Date == "1/2/2007" | elecd$Date == "2/2/2007",]

## Display Histogram
hist(as.numeric(ed$Global_active_power), col = "red", 
     xlab = "Global Active Power (Kilowatts)", main="Global Active Power")

##Note: I am colorblind, so the color may be off 

## Put the plot into a file
dev.copy(png, file= 'plot1.png')                     # Copy displayed plot to a file
dev.off()                                            # Close File to make it available
