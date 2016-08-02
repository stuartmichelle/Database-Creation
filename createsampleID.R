# This script is for generating Pinsky Lab ID numbers for tissue samples

library(RMySQL)
leyte <- dbConnect(MySQL(), host="amphiprion.deenr.rutgers.edu", user="michelles", password="larvae168", dbname="Leyte", port=3306)

pieces <- dbSendQuery(leyte, "
select clownfish.Spp, 
      clownfish.ID, 
      YEAR(diveinfo.Date) 
from clownfish 
join anemones on clownfish.anem_table_id = anemones.anem_table_id
join diveinfo on anemones.dive_table_id = diveinfo.id
where clownfish.ID is not null 
  and clownfish.Sample_ID is null;")

pieces <- fetch(pieces, n = -1)

# Change ID to 3 digits (leading zeros)
pieces$ID <- formatC(pieces$ID, width = 3, format = "d", flag = "0")

id <- paste(pieces$Spp, pieces$`YEAR(diveinfo.Date)`, "_", pieces$ID, sep = "")

