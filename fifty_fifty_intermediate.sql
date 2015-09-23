CREATE TABLE cstdm_schema.fifty_fifty AS
SELECT origin_county_id, SUM(gl_sum)
FROM
(
SELECT origin_county_id, gl_sum
FROM cstdm_schema.fifty_fifty_intermediate
UNION ALL
SELECT dest_county_id, gl_sum
FROM cstdm_schema.fifty_fifty_intermediate
) R1
GROUP BY origin_county_id
ORDER BY origin_county_id;