DROP TABLE IF EXISTS cstdm_schema.aggregation_demandtable;

CREATE TABLE cstdm_schema.aggregation_demandtable AS
  SELECT hh_id, person_id, tour_id, stop_id, inbound, tour_purpose,origin_county_name, dest_county_name, orig_taz, dest_taz, "GL1", "GL2", "GL3", "GL4","GL5", "GL6", "GL7", "GL8", "GL9"
  FROM cstdm_schema.demandtable
  INNER JOIN cstdm_schema.mega_table
  ON (orig_taz = "A") AND (dest_taz = "B");