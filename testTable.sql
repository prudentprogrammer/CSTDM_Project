DROP TABLE IF EXISTS testtable;

CREATE TABLE testtable (
pid smallint,
tourid smallint,
stopid smallint,
dest_taz smallint,
gl1 numeric(10,2),
gl2 numeric(10,2)
);

INSERT INTO testtable VALUES (1, 0, 0, 10, 6.54, 2.3);
INSERT INTO testtable VALUES (1, 0, 1, 2, 1.24, 0.08);
INSERT INTO testtable VALUES (1, 0, -1, 100, 5.9, 1.2);
INSERT INTO testtable VALUES (1, 1, 0, 32, 1.54, 6.2);
INSERT INTO testtable VALUES (1, 1, -1, 7, 0.09, 0.01);