# Create the table in the database ----------------------------------------

library(RMySQL)
leyte <- dbConnect(MySQL(), host="amphiprion.deenr.rutgers.edu", user="michelles", password="larvae168", dbname="Leyte", port=3306)

dbSendQuery(leyte, "CREATE TABLE `anemones` (
  `anem_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `dive_table_id` int(11) NOT NULL,
  `DiveNum` int(11) NOT NULL,
  `ObsTime` time NOT NULL,
  `Collector` text NOT NULL,
  `GPS` text,
  `Depth_m` text,
  `Depth_ft` text,
  `AnemSpp` text,
  `AnemDia` text,
  `oldAnemID` text,
  `AnemID` text,
  `AnemSampleID` text,
  `Notes` text,
  PRIMARY KEY (`anem_table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20221 DEFAULT CHARSET=latin1;")
