DO
$$
DECLARE
  rec record;
  nbrow bigint;
BEGIN
  FOR rec IN
    SELECT orig_taz, dest_taz
    FROM cstdm_schema.demandtable
  LOOP
    EXECUTE 'SELECT seq, id1 AS node, id2 AS edge, cost FROM pgr_dijkstra("SELECT id, source, target, cost FROM cstdm_schema.edge_table",'
    || rec.orig_taz || "," || rec.dest_taz || ", false, false);";
  END LOOP;
END
$$;