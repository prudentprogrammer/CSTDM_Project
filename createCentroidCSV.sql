DROP TABLE IF EXISTS cstdm_schema.tmp_centroid;

CREATE TABLE cstdm_schema.tmp_centroid AS
  SELECT DISTINCT "A", freeflow."FT"
  FROM cstdm_schema.freeflow
  WHERE "FT" = 6
  ORDER BY "A";
  
\copy cstdm_schema.tmp_centroid TO 'C:\Users\abharadw\Desktop\CSTDM Post Processing\centroid_table.csv' DELIMITER ',' CSV HEADER;