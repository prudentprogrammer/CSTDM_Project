CREATE TABLE cstdm_schema.random1000Trips AS
    SELECT * FROM cstdm_schema.individualtrips
    ORDER BY RANDOM()
    LIMIT 1000;