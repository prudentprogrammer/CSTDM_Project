import psycopg2
import psycopg2.extras
import sys
import pprint

def addRoutesToMegaTable():

  # Define connection string
  conn_string = "host='localhost' dbname='mtc_db' user='postgres' password='postgres'"
  
  # get a connection, if a connect cannot be made an exception will be raised here
  conn = psycopg2.connect(conn_string)

  # conn.cursor will return a cursor object, you can use this cursor to perform queries
  cursor = conn.cursor()

  cursor.execute("SELECT * FROM inttable");
  row = cursor.fetchone()
  
  while row:
    print(row)
    
    for x in row[4]:
      temp = x.split(":")
      key = temp[0]
      value = temp[1]
      print(type(key))
      
      
    row = cursor.fetchone()
    
    conn.commit()


if __name__ == "__main__":
  addRoutesToMegaTable()