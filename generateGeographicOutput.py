import psycopg2
import psycopg2.extras
import sys
import pprint

def createGeoTable():

  # Define connection string
  conn_string = "host='localhost' dbname='mtc_db' user='postgres' password='postgres'"
  
  # get a connection, if a connect cannot be made an exception will be raised here
  conn = psycopg2.connect(conn_string)

  # conn.cursor will return a cursor object, you can use this cursor to perform queries
  cursor = conn.cursor()
  
  cursor.execute('DROP TABLE IF EXISTS cstdm_schema.geographic_output')
  cursor.execute('CREATE TABLE cstdm_schema.geographic_output (countyid integer, percentages numeric);')
  conn.commit()
  
  cursor.execute('SELECT * FROM cstdm_schema.geographic_intermediate;')
  
  # retrieve the records from the database
  records = cursor.fetchall()
  
  for index, item in enumerate(records[0]):
    cursor.execute('INSERT INTO cstdm_schema.geographic_output VALUES ( ' + str((index + 1)) + ',' + str(item) + ')' )
    conn.commit()
    
  print('Done executing script')
  
if __name__ == "__main__":
  createGeoTable()
  