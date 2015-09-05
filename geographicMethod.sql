SELECT 
SUM("GL1") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")) AS "GL1 %",
SUM("GL2") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")) AS "GL2 %",
SUM("GL3") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")) AS "GL3 %",
SUM("GL4") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")) AS "GL4 %",
SUM("GL5") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")) AS "GL5 %",
SUM("GL6") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")) AS "GL6 %",
SUM("GL7") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")) AS "GL7 %",
SUM("GL8") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")) AS "GL8 %",
SUM("GL9") / (SUM("GL1"+ "GL2" + "GL3" + "GL4" + "GL5" + "GL6" + "GL7" + "GL8" + "GL9")) AS "GL9 %"
FROM cstdm_schema.aggregation_demandtable;