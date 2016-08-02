# Create the table in the database ----------------------------------------

library(RMySQL)
leyte <- dbConnect(MySQL(), host="amphiprion.deenr.rutgers.edu", user="michelles", password="larvae168", dbname="Leyte", port=3306)

dbSendQuery(leyte, "
CREATE TABLE `anemones` (
  `anem_table_id` int(11) NOT NULL,
  `dive_table_id` int(11) NOT NULL,
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
  `Spp` text,
  `NumFish` int(11) DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`anem_table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;")

