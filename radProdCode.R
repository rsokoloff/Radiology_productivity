library(readr)
library(zoo)

path = "Data"
dataRaw <-
  read_csv(paste(path, "2019-05-21_VISN_9_Radiology_productivity.csv", sep = "/"),
           col_names = T,
           na = "NULL"
           
           )

dataRaw$DatePulled <- as.Date(dataRaw$DatePulled,  format = "%m/%d/%Y")
dataRaw$ForMonth <-  zoo::as.yearmon(dataRaw$ForMonth, format = "%y-%b")
dataRaw$Sta3n <- as.factor(dataRaw$Sta3n)
dataRaw$ImagingType <- as.factor(dataRaw$ImagingType)
dataRaw$DivisionName <- as.factor(dataRaw$DivisionName)
dataRaw$TotalCompletedExams <- as.integer(dataRaw$TotalCompletedExams)
dataRaw$TotalNoShowed <- as.integer(dataRaw$TotalNoShowed)
dataRaw$scheduled_14 <- as.integer(dataRaw$scheduled_14)
dataRaw$scheduled_30 <- as.integer(dataRaw$scheduled_30)
dataRaw$scheduled_31_60 <- as.integer(dataRaw$scheduled_31_60)
dataRaw$scheduled_61_90 <- as.integer(dataRaw$scheduled_61_90)
dataRaw$scheduled_91_120 <- as.integer(dataRaw$scheduled_91_120)
dataRaw$scheduled_120 <- as.integer(dataRaw$scheduled_120)




