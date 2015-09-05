CREATE OR REPLACE FUNCTION createSPT() RETURNS text AS $$
  DECLARE
    e cstdm_schema.edge_table%ROWTYPE;
  BEGIN
    FOR i in 1..10 LOOP
      RAISE NOTICE 'i = %', i;
    END LOOP;
  
  
  END;
  
$$ LANGUAGE plpgsql;

SELECT createSPT();