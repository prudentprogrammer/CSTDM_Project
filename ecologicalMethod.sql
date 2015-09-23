SELECT * FROM
(
SELECT county, sum_gl
FROM cstdm_schema.ecological_footprint
INNER JOIN cstdm_schema.tazdata
ON (dest_taz = zone)) R1
LIMIT 100