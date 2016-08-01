# Create the table in the database ----------------------------------------

library(RMySQL)
leyte <- dbConnect(MySQL(), host="amphiprion.deenr.rutgers.edu", user="michelles", password="larvae168", dbname="Leyte", port=3306)

dbSendQuery(leyte, "CREATE TABLE `diveinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DiveNum` decimal(10,2) NOT NULL,
  `CollectingAPCL` binary(1) NOT NULL,
  `Date` date NOT NULL,
  `Name` text NOT NULL,
  `Municipality` text NOT NULL,
  `GPS` int(11) NOT NULL,
  `Divers` text NOT NULL,
  `StartTime` text NOT NULL,
  `EndTime` text NOT NULL,
  `Duration` text NOT NULL,
  `Discontinuous` binary(1) NOT NULL,
  `PauseStart` text NOT NULL,
  `PauseEnd` text NOT NULL,
  `Weather` text,
  `Current_knots` decimal(10,2) DEFAULT NULL,
  `WaveHeight_cm` decimal(10,2) DEFAULT NULL,
  `Visibility_m` decimal(10,2) DEFAULT NULL,
  `Wind_mph` decimal(10,2) DEFAULT NULL,
  `Tide` text,
  `Topo_m` decimal(10,2) DEFAULT NULL,
  `DepthTop_m` decimal(10,2) DEFAULT NULL,
  `DepthBottom_m` decimal(10,2) DEFAULT NULL,
  `Cover` text,
  `Notes` text,
  `correction` text,
  `corr_date` date DEFAULT NULL,
  `corr_editor` tinytext,
  `corr_message` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=latin1;")
