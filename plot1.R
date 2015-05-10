# Exploratory Data Analysis
# Ranew Mohydin

# Assignment 1 - Plot 1

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

# Plot 1
png("plot1.png")
hist(data[,3], col="red", main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)")
dev.off()
