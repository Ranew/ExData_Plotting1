# Exploratory Data Analysis
# Ranew Mohydin

# Assignment 1 - Plot 2

# Set working Directory
setwd("/Users/mac/Google Drive/University/Online Courses/Exploratory Data Analysis/Assignment 1")
install.packages("lubridate")
library(lubridate)

# Load the data and tidy that shit up
data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
data[,1] <- dmy(data[,1])
rows1 <- which(data[,1]==ymd("2007-02-01"))
rows2 <- which(data[,1]==ymd("2007-02-02"))
data <- data[c(rows1,rows2),]
for(i in 3:9){
  data[,i] <- as.numeric(data[,i]) # Make all other columns to numeric
}
rm(list=setdiff(ls(), "data")) # Clean the enviroment

# Plot 2
png("plot2.png")
plot(data[,3],type = "l", main="", ylab="Global Active Power (kilowatts)", xlab="" ,xaxt='n')
pts <- c(1,NROW(data)/2,NROW(data)) # Find nice points for the day labels
axis(1, at=pts, labels=c("Thu","Fri", "Sat"))
dev.off()
