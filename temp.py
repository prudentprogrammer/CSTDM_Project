import psycopg2
import psycopg2.extras
import sys
import pprint

def generateEcologicalFootprint():

  # Define connection string
  conn_string = "host='localhost' dbname='mtc_db' user='postgres' password='postgres'"
  
  # get a connection, if a connect cannot be made an exception will be raised here
  conn = psycopg2.connect(conn_string)

  # conn.cursor will return a cursor object, you can use this cursor to perform queries
  cursor = conn.cursor(name='super_cursor', withhold=True)

  cursor.execute("SELECT * FROM cstdm_schema.intermediate_ecological");

  # row[0] - person_id
  # row[1] - tour_id
  # row[2] - tour_purpose
  # row[3] - total_halftrips
  # row[4] - gl_sum
  # row[5] - dest_taz list
  i = 0
  print('Running...')
  while True:
  
    rows = cursor.fetchmany(1000)
    print(i)
    i += 1
    if not rows:
      break
    cursor2 = conn.cursor()
    
    for row in rows:  
      totalHalfTrips = row[3]
      
      if totalHalfTrips == 0:
        myDict = {}
        for x in row[5]:
          temp = x.split(":")
          key = int(temp[0])
          value = int(temp[1])
          
          myDict[key] = value
        last_trip = max(myDict, key=int)
        dest_taz = myDict[last_trip]
        insertQuery = r"""
        INSERT INTO cstdm_schema.ecological_footprint
        VALUES 
        """ + "(" + str(row[0]) + "," + str(row[1]) + ",'" + row[2] + "'," + str(dest_taz) + "," + str(sum(row[4])) + ");"
        cursor2.execute(insertQuery)
        conn.commit()
      
      elif totalHalfTrips == 1:
        for x in row[5]:
          temp = x.split(":")
          key = temp[0]
          value = temp[1]
          if key == '-1':
            dest_taz = value
          
        #print(type(str(sum(row[4]))))
        #print('Allocating to ', dest_taz)    
        insertQuery = r"""
        INSERT INTO cstdm_schema.ecological_footprint
        VALUES 
        """ + "(" + str(row[0]) + "," + str(row[1]) + ",'" + row[2] + "'," + dest_taz + "," + str(sum(row[4])) + ");"
        
        cursor2.execute(insertQuery)
        conn.commit()
      
      elif totalHalfTrips == 2:
        dest_taz_list = []
        for x in row[5]:
          temp = x.split(":")
          key = temp[0]
          value = temp[1]
          dest_taz_list.append(value)
          
        for i in range(2):
          insertQuery = r"""
          INSERT INTO cstdm_schema.ecological_footprint
          VALUES 
          """ + "(" + str(row[0]) + "," + str(row[1]) + ",'" + row[2] + "'," + dest_taz_list[i] + "," + str(row[4][i]) + ");"
          cursor2.execute(insertQuery)
          conn.commit()
      
      cursor2.close()

      conn.commit()

  print('Done with script.')

if __name__ == "__main__":
  generateEcologicalFootprint()