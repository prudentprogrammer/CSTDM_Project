SELECT seq, id1 AS node, id2 AS edge, cost
FROM pgr_dijkstra('SELECT id, source, target, cost FROM cstdm_schema.edge_table', 421, 394, false, false);