import psycopg2
import psycopg2.extras
import sys
import pprint

def create5050Table():

  # Define connection string
  conn_string = "host='localhost' dbname='mtc_db' user='postgres' password='postgres'"
  
  # get a connection, if a connect cannot be made an exception will be raised here
  conn = psycopg2.connect(conn_string)

  # conn.cursor will return a cursor object, you can use this cursor to perform queries
  cursor = conn.cursor()
  
  cursor.execute('DROP TABLE IF EXISTS cstdm_schema.fifty_fifty_output')
  cursor.execute('CREATE TABLE cstdm_schema.fifty_fifty_output (countyid integer, percentages numeric);')
  conn.commit()
  
  cursor.execute('SELECT SUM(sum) FROM cstdm_schema.fifty_fifty;')
  
  # retrieve the records from the database
  records = cursor.fetchall()
  
  total_sum = records[0][0]
  
  cursor.execute('SELECT * FROM cstdm_schema.fifty_fifty;')
  
  records = cursor.fetchall()
  
  for item in records:
    cursor.execute('INSERT INTO cstdm_schema.fifty_fifty_output VALUES ( ' + str(item[0]) + ',ROUND(' + str(item[1]/total_sum) + ', 2))' )
    conn.commit()
    
  print('Done executing script')
  
if __name__ == "__main__":
  create5050Table()
  