library(readr)

path = "Data"
dataRaw <- read_csv(paste(path, "2019-05-21_VISN_9_Radiology_productivity.csv", sep = "/"),
                    col_names = TRUE,
                    col_types = cols(
                    .default = col_integer(),
                    DatePulled <- col_date(format = "%m/%d/%Y"),
                    ForMonth <- col_date(format = "%b-%y"),
                    Sta3n <- col_factor(),
                    ImagingType <- col_factor(),
                    DivisionName <- col_factor(),
                    TotalCompletedExams <- col_number(),
                    TotalNoShowed <- col_number(),
                    `<=14` <- col_number(),
                    `<=30` <- col_number(),
                    `31-60` <- col_number(),
                    `61-90` <- col_number(),
                    `91-120` <- col_number(),
                    `>120` <- col_number(),
                    TotalOrders <- col_number()
                    )
)
                    