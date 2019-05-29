library(dplyr)
library(ggplot2)
library(readr)
library(stringr)
library(zoo)

path = "Data"
dataRaw <-
  read_csv(paste(path, "2019-05-21_VISN_9_Radiology_productivity.csv", sep = "/"),
           col_names = T,
           na = "NULL"
           )
dataDate <- stringr::str_sub(list.files("Data"), 1, 10)
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



p <- ggplot(dataRaw, aes(x = reorder(ImagingType, -TotalCompletedExams,
                                  function(x) {sum(x)}
                                  )
                      )
         )
p <- p + stat_summary(aes(y = TotalCompletedExams), fun.y = sum,
    geom = "bar", color = "black", fill = "dodger blue"
    )
p <- p + scale_y_continuous(labels = scales::comma)
p <- p + labs(x = NULL, y = "Exams")
p <- p + theme(axis.text.x = element_text(angle = 60, hjust = 1, vjust = 1))
p <- p + theme(axis.title.y = element_text(angle = 0, vjust = 0.75))
p <- p + theme(plot.title = element_text(hjust = 0.5))
p <- p + labs(title = "Imaging exams", subtitle = format (as.Date(dataDate), "%b %d, %Y"))
print(p)