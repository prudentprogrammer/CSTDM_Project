-- file: setup.sql
-- Author: Arjun Bharadwaj
-- Date: August 5th, 2015

-- Drop the tables if they already exist in the database
DROP TABLE IF EXISTS cstdm_schema.freeflow;

-- Create the new tables with the required attributes
CREATE TABLE cstdm_schema.freeflow (
  "A" integer, -- This field is named 'A' in the original file
  "B" integer, -- This field is named 'B' in the original file
  "DISTANCE" decimal,
  "SPDCLASS" integer,
  "CAPCLASS" integer,
  "LANES" integer,
  "TSIN" integer,
  "GL" integer,
  "USE" integer,
  "OT" decimal,
  "CAP" integer,
  "AT" integer,
  "FT" integer,
  "SIGCOR" integer,
  "TOS" integer,
  "AUX" integer,
  "YEAR" integer,
  "FFS" integer,
  "FFT" decimal,
  "FT2000" integer,
  "ROUTENUM" integer,
  "HOT" integer,
  "TOLLCLASS" integer,
  "BRT" integer,
  "METER" integer
);

\copy cstdm_schema.freeflow FROM 'C:\Users\abharadw\Desktop\CSTDM Post Processing\freeflow.csv' DELIMITER ',' CSV HEADER;

