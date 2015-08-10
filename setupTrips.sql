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