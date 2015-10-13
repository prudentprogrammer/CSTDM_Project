-- file: createAllTables.sql
-- Author: Arjun Bharadwaj
-- Date Created: 17th August 2015
-- Date Modified: 19th September 2015
-- Description: This sql set's all the files and creates tables.
-- An alternate option is to import from the backup utility, which might be easier.

-- Drop Schema if it already exists
DROP SCHEMA IF EXISTS cstdm_schema CASCADE;

-- Create a new schema
CREATE SCHEMA cstdm_schema;

-- tazdata creation

DROP TABLE IF EXISTS cstdm_schema.tazdata;

CREATE TABLE cstdm_schema.tazdata (
  ZONE integer,
  DISTRICT integer,
  SD integer,
  COUNTY integer,
  TOTHH integer,
  HHPOP integer,
  TOTPOP integer,
  EMPRES integer,
  SFDU integer,
  MFDU integer,
  HHINCQ1 integer,
  HHINCQ2 integer,
  HHINCQ3 integer,
  HHINCQ4 integer,
  TOTACRE numeric,
  RESACRE integer,
  CIACRE integer,
  SHPOP62P numeric,
  TOTEMP integer,
  AGE0004 integer,
  AGE0519 integer,
  AGE2044 integer,
  AGE4564 integer,
  AGE65P integer,
  RETEMPN integer,
  FPSEMPN integer,
  HEREMPN integer,
  OTHEMPN integer,
  AGREMPN integer,
  MWTEMPN integer,
  PRKCST numeric,
  OPRKCST numeric,
  AREATYPE integer,
  HSENROLL numeric,
  COLLFTE numeric,
  COLLPTE numeric,
  TOPOLOGY numeric,
  TERMINAL numeric,
  ZERO integer,
  hhlds integer,
  sftaz integer,
  gqpop integer
);

\copy cstdm_schema.tazdata FROM 'C:\Users\abharadw\Desktop\CSTDM Post Processing\tazData.csv' DELIMITER ',' CSV HEADER;

-- trips creation

DROP TABLE IF EXISTS cstdm_schema.individualTrips;

CREATE TABLE cstdm_schema.individualTrips (
  hh_id bigint,
  person_id bigint,
  person_num integer,
  tour_id integer,
  stop_id integer,
  inbound smallint,
  tour_purpose varchar(25),
  orig_purpose varchar(25),
  dest_purpose varchar(25),
  orig_taz integer,
  orig_walk_segment smallint,
  dest_taz integer,
  dest_walk_segment integer,
  parking_taz integer,
  depart_hour integer,
  trip_mode integer,
  tour_mode integer,
  tour_category varchar(30)
);

\copy cstdm_schema.individualTrips FROM 'C:\Users\abharadw\Desktop\CSTDM Post Processing\indivTripData_4.csv' DELIMITER ',' CSV HEADER;

-- county creation

DROP TABLE IF EXISTS cstdm_schema.countyNames;

CREATE TABLE cstdm_schema.countyNames (
  countyid integer,
  countyname varchar(32)
);

INSERT INTO cstdm_schema.countyNames VALUES (1, 'San Francisco');
INSERT INTO cstdm_schema.countyNames VALUES (2, 'San Mateo');
INSERT INTO cstdm_schema.countyNames VALUES (3, 'Santa Clara');
INSERT INTO cstdm_schema.countyNames VALUES (4, 'Alameda');
INSERT INTO cstdm_schema.countyNames VALUES (5, 'Contra Costa');
INSERT INTO cstdm_schema.countyNames VALUES (6, 'Solano');
INSERT INTO cstdm_schema.countyNames VALUES (7, 'Napa');
INSERT INTO cstdm_schema.countyNames VALUES (8, 'Sonoma');
INSERT INTO cstdm_schema.countyNames VALUES (9, 'Marin');

-- flow creation

-- Drop the tables if they already exist in the database
DROP TABLE IF EXISTS cstdm_schema.freeflow;

-- Create the new tables with the required attributes
CREATE TABLE cstdm_schema.freeflow (
  "A" integer,
  "B" integer,
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

DROP TABLE IF EXISTS cstdm_schema.individualTours;

CREATE TABLE cstdm_schema.individualtours
(
  hh_id bigint,
  person_id bigint,
  person_num integer,
  person_type integer,
  tour_id integer,
  tour_category character varying(32),
  tour_purpose character varying(32),
  orig_taz integer,
  orig_walk_segment smallint,
  dest_taz integer,
  dest_walk_segment integer,
  start_hour integer,
  end_hour integer,
  tour_mode integer,
  atwork_freq integer,
  num_ob_stops integer,
  num_ib_stops integer
);

\copy cstdm_schema.individualtours FROM 'D:\MTC_BASE\input\indivTourData_4.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS cstdm_schema.jointTrips;

CREATE TABLE cstdm_schema.jointTrips
(
  hh_id bigint,
  tour_id integer,
  stop_id integer,
  inbound integer,
  tour_purpose character varying(32),
  orig_purpose character varying(32),
  dest_purpose character varying(32),
  orig_taz integer,
  orig_walk_segment smallint,
  dest_taz integer,
  dest_walk_segment integer,
  parking_taz integer,
  depart_hour integer,
  trip_mode integer,
  num_participants integer,
  tour_mode integer,
  tour_category character varying(32)
);

\copy cstdm_schema.jointTrips FROM 'D:\MTC_BASE\input\jointTripData_4.csv' DELIMITER ',' CSV HEADER;


