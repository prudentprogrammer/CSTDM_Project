DROP TABLE IF EXISTS cstdm_schema.withincounty;
DROP TABLE IF EXISTS cstdm_schema.betweencounty;

CREATE TABLE cstdm_schema.withincounty AS
  SELECT person_id, origin_county_name, dest_county_name, orig_taz, dest_taz
  FROM cstdm_schema.demandtable
  WHERE origin_county_name = dest_county_name;
  
CREATE TABLE cstdm_schema.betweencounty AS
  SELECT person_id, origin_county_name, dest_county_name, orig_taz, dest_taz
  FROM cstdm_schema.demandtable
  WHERE origin_county_name != dest_county_name;
  