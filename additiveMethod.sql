

SELECT hh_id, person_id, tour_id, inbound, tour_purpose, array_agg( stop_id::text || ':' || orig_taz::text || ',' || dest_taz::text) AS route_details, SUM("GL1") AS GL1_SUM,SUM("GL2") AS GL2_SUM, SUM("GL3") AS GL3_SUM,SUM("GL4") AS GL4_SUM,SUM("GL5") AS GL5_SUM,SUM("GL6") AS GL6_SUM,SUM("GL7") AS GL7_SUM,SUM("GL8") AS GL8_SUM,SUM("GL9") AS GL9_SUM, array_cat_agg(route_order) AS route_orders
FROM
(
  SELECT hh_id, person_id, tour_id, stop_id, inbound, tour_purpose, orig_taz, dest_taz, "GL1","GL2","GL3","GL4","GL5","GL6","GL7","GL8","GL9", route_order FROM
  (
    (
      SELECT hh_id, person_id, tour_id, stop_id, inbound, tour_purpose, orig_taz, dest_taz
      FROM cstdm_schema.trips1through6
    ) R1
    INNER JOIN cstdm_schema.mega_table_with_routes
    ON ("A" = orig_taz) AND ("B" = dest_taz)
  ) R2
) R3
GROUP BY hh_id, person_id, tour_id, inbound, tour_purpose;