# This program creates plot1.png from the dataset.
# It is presumed the dataset exists in "../data/household_power_consumption.txt"

plot1 <- function( datafile = "C:/Users/M313748/Desktop/household_power_consumption.txt"){
        # rJava is a package that is presumed to be installed.  Proper configuration can be tricky.
        # See the README for configuration consideratins.
        
        library(rJava)
        
        # data.table is reuired for fread
        library(data.table)
        
        # turn of warnings for fread which will throw copious warnings otherwise
        options( warn=-1)
        tTab <- fread(datafile, sep=";", header=TRUE)
        options(warn = 0)
        
        # coerce the Date field in the table to into a Date object
        tTab$Date <- as.Date(tTab$Date, format = "%d/%m/%Y")
        
        # select the specific dates we want from the data, per the assignment
        s3 <-tTab[ tTab$Date == as.Date("2007-2-1") | tTab$Date == as.Date("2007-2-2"),]
        
        # initialize the png device image dimensions specified
        png(filename = "plot1.png", width=480, height=480)
        
        # create the histogram per the specification and close the png device
        hist(as(s3$Global_active_power, "numeric")/500, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
        dev.off()
}

plot1()
