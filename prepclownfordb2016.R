# This script is for importing dive info into the Leyte database - MRS

# This version has been specialized to import 2016 data into the database

clownfishcoltypes <- c("numeric", "date", "text", "numeric", "numeric",  "numeric", "text", "numeric", "numeric", "numeric",  "numeric", "text", "numeric", "text", "text",  "text", "numeric", "numeric", "text", "text",  "text", "numeric", "numeric", "text", "text",  "text", "numeric", "numeric", "text", "text",  "text", "numeric", "numeric", "text", "text",  "text", "numeric", "numeric", "text", "text",  "text", "numeric", "text", "text", "text",  "text", "text", "text", "numeric", "numeric",  "numeric", "numeric", "text")

clown <- readxl::read_excel("~/Documents/Philippines/Surveys_2016/GPSSurveys2016_20160714_MRS.xlsx", sheet = "Clownfish", col_names=TRUE, col_types = clownfishcoltypes)

# strip out Excel default date from StartTime, EndTime, PauseStart, and PauseEnd
clown$ObsTime <- gsub('1899-12-30 ', '', clown$ObsTime)

# Remove extra NA rows
clown <- clown[!is.na(clown$DiveNum),]

library(RMySQL)
leyte <- dbConnect(MySQL(), host="amphiprion.deenr.rutgers.edu", user="michelles", password="larvae168", dbname="Leyte", port=3306)

dbWriteTable(leyte,"gpssurvey_clownfish",data.frame(clown), row.names = FALSE, append = TRUE)

dbDisconnect(leyte)
rm(leyte)
