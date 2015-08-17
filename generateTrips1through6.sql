CREATE TABLE cstdm_schema.trips1through6 AS
  SELECT *
  FROM cstdm_schema.individualtrips
  WHERE trip_mode >= 1 AND trip_mode <= 6;