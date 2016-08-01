# Create the table in the database ----------------------------------------

library(RMySQL)
leyte <- dbConnect(MySQL(), host="amphiprion.deenr.rutgers.edu", user="michelles", password="larvae168", dbname="Leyte", port=3306)

dbSendQuery(leyte, "CREATE TABLE `clownfish` (
  `fish_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `dive_id` int(11) DEFAULT NULL,
  `anem_table_id` bigint(20) DEFAULT NULL,
  `Spp` text,
  `Size` double DEFAULT NULL,
  `ID` double DEFAULT NULL,
  `Col` text,
  `Recap` text,
  `TagID` text,
  `Notes` text,
  `Collector` text,
  `correction` text,
  `corr_date` date DEFAULT NULL,
  `corr_editor` tinytext,
  `corr_message` tinytext,
  PRIMARY KEY (`fish_table_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;")
