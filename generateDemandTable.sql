﻿CREATE TABLE cstdm_schema.demandtable AS
  SELECT person_id, tour_id, origin_county_name, countyname as dest_county_name, orig_taz, dest_taz, orig_taz AS origin_centroid, dest_taz AS dest_centroid FROM
  (
    SELECT person_id, tour_id, origin_county_name, tazdata.county AS dest_county_id, orig_taz, dest_taz FROM
    (
      SELECT person_id, tour_id, countyname as origin_county_name, orig_taz, dest_taz FROM 
      (
        SELECT person_id, tour_id, tazdata.county AS origin_county_id, orig_taz, dest_taz
        FROM cstdm_schema.trips1through6
        INNER JOIN cstdm_schema.tazdata ON (orig_taz = "zone")
      ) R1
      INNER JOIN cstdm_schema.countynames ON (R1.origin_county_id = countyid)
    ) R2
    INNER JOIN cstdm_schema.tazdata ON (dest_taz = "zone")
  ) R3
  INNER JOIN cstdm_schema.countynames ON (R3.dest_county_id = countyid);