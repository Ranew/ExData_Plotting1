# Exploratory Data Analysis
# Ranew Mohydin

# Assignment 1 - Plot 3

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

# Plot 3
png("plot3.png")
plot(data[,7], col="black", type="l", axes=FALSE, ylab="", xlab="", ylim=c(0,38))
par(new=T)
plot(data[,8], col="red", type="l", axes=FALSE, ylab="", xlab="", ylim=c(0,38))
par(new=T)
plot(data[,9], col="blue", type="l", axes=FALSE, ylab="Energy sub metering", xlab="", ylim=c(0,38))
pts <- c(1,NROW(data)/2,NROW(data))
axis(1, at=pts, labels=c("Thu","Fri", "Sat"))
axis(2, at = c(0,10,20,30))
legend("topright", colnames(data)[7:9], lty=1, col=c("black", "red", "blue"))
box()
dev.off()




