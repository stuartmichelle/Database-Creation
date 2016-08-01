# This script is for importing dive info into the Leyte database - MRS

# This version has been specialized to import 2016 data into the database

surv <- readxl::read_excel("~/Documents/Philippines/Surveys_2016/GPSSurveys2016_20160714_MRS.xlsx", sheet = "DiveInfo", col_names=TRUE)

# strip out Excel default date from StartTime, EndTime, PauseStart, and PauseEnd
surv$StartTime <- gsub('1899-12-30 ', '', surv$StartTime)
surv$EndTime <- gsub('1899-12-30 ', '', surv$EndTime)
surv$PauseStart <- gsub('1899-12-30 ', '', surv$PauseStart)
surv$PauseEnd <- gsub('1899-12-30 ', '', surv$PauseEnd)
surv$Duration <- gsub('1899-12-30 ', '', surv$Duration)

# Remove extra NA rows
surv <- surv[!is.na(surv$DiveNum),]


# write.table(surv, file = "~/Documents/Philippines/todb/DiveInfo2016.csv", row.names = F, sep = ";")

library(RMySQL)
leyte <- dbConnect(MySQL(), host="amphiprion.deenr.rutgers.edu", user="michelles", password="larvae168", dbname="Leyte", port=3306)

dbWriteTable(leyte,"gpssurvey_diveinfo",data.frame(surv), row.names = FALSE, append = TRUE)

dbDisconnect(leyte)

