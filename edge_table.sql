DROP TABLE IF EXISTS cstdm_schema.edge_table;

CREATE TABLE cstdm_schema.edge_table (
  id SERIAL,
  source int4,
  target int4,
  cost float8
);

INSERT INTO cstdm_schema.edge_table (source, target, cost)
SELECT "A", "B", "DISTANCE"
FROM cstdm_schema.freeflow;