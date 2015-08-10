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