DROP TABLE cstdm_schema.geographic_intermediate;

CREATE TABLE cstdm_schema.geographic_intermediate
SELECT 
ROUND(SUM("GL1") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")), 2) AS "GL1 %",
ROUND(SUM("GL2") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")), 2) AS "GL2 %",
ROUND(SUM("GL3") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")), 2) AS "GL3 %",
ROUND(SUM("GL4") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")), 2) AS "GL4 %",
ROUND(SUM("GL5") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")), 2) AS "GL5 %",
ROUND(SUM("GL6") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")), 2) AS "GL6 %",
ROUND(SUM("GL7") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")), 2) AS "GL7 %",
ROUND(SUM("GL8") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")), 2) AS "GL8 %",
ROUND(SUM("GL9") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")), 2) AS "GL9 %"
FROM cstdm_schema.aggregation_demandtable;