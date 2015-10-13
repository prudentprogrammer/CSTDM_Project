DROP TABLE IF EXISTS cstdm_schema.individualTours;

CREATE TABLE cstdm_schema.individualTours (
  hh_id bigint,
  person_id bigint,
  person_num integer,
  person_type integer,
  tour_id integer,
  tour_category varchar(32),
  tour_purpose varchar(32),
  orig_taz integer,
  orig_walk_segment smallint,
  dest_taz integer,
  dest_walk_segment integer,
  start_hour integer,
  end_hour integer,
  tour_mode integer,
  atWork_freq integer,
  num_ob_stops integer,
  num_ib_stops integer
);

COPY cstdm_schema.individualTours FROM 'D:\MTC_BASE\input\indivTourData_4.csv' DELIMITER ',' CSV HEADER;