#import libraries
library(data.table)
library(tidyverse)
library(dplyr)

#import dataset
melbourne <- fread("Melbourne_housing_FULL.csv")

#remove unneeded columns
houseData <- select(melbourne, -Address,-Date, -Landsize, -Lattitude, 
                    -Longtitude, -SellerG, -Propertycount, -Distance,
                    -Regionname, -CouncilArea, -Bedroom2)

#change NA values to 0
houseData[is.na(houseData)] = 0

#
houseData1 <- houseData

houseData[houseData == "h"] <- "1"
houseData[houseData == "t"] <- "2"
houseData[houseData == "u"] <- "3"

houseData$Type <- as.integer(houseData$Type)
