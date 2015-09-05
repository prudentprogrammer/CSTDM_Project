DROP TABLE IF EXISTS cstdm_schema.intermediate_ecological;

CREATE TABLE cstdm_schema.intermediate_ecological AS
  SELECT person_id, tour_id, tour_purpose, COUNT(case when stop_id=-1 THEN 1 END) AS total_halftrips, 
  array_agg(COALESCE("GL1",0) + COALESCE("GL2",0) + COALESCE("GL3",0) + COALESCE("GL4",0) + COALESCE("GL5",0) + COALESCE("GL6",0) + COALESCE("GL7",0) + COALESCE("GL8",0) + COALESCE("GL9",0)) AS GL_SUM, 
  array_agg(stop_id::text || ':' || dest_taz::text)
  FROM cstdm_schema.aggregation_demandtable
  GROUP BY person_id, tour_id, tour_purpose;