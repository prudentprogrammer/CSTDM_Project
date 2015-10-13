import psycopg2
import psycopg2.extras
import sys
import pprint
import decimal
from itertools import accumulate

def generateEcologicalFootprint():

  # Define connection string
  conn_string = "host='localhost' dbname='mtc_db' user='postgres' password='postgres'"
  
  # get a connection, if a connect cannot be made an exception will be raised here
  conn = psycopg2.connect(conn_string)

  # conn.cursor will return a cursor object, you can use this cursor to perform queries
  cursor = conn.cursor(name='super_cursor', withhold=True)
  
  cursor.execute("SELECT * FROM additive_intermediate");

  # row[0] - hh_id
  # row[1] - person_id
  # row[2] - tour_id
  # row[3] - inbound
  # row[4] - tour_purpose
  # row[5] - route_details
  # row[6] - row[14] - county_sum
  # row[15] - route_orders
  print('Running...')
  while True:
  
    rows = cursor.fetchmany(1000)
    if not rows:
      break
    cursor2 = conn.cursor()
    
    for row in rows:  
      routeDetails = row[5]
      
      half_trip = False
      myDict = {}
      value = ''
      orig_taz = ''
      dest_taz = ''
      for x in routeDetails:
        temp = x.split(":")
        key = int(temp[0])
        value = temp[1]
        
        if key == -1:
          orig_taz = value.split(",")[0]
          dest_taz = value.split(",")[1]
          value = value.replace(",", "-")
          half_trip = True
        else:
          myDict[key] = value
          value = ''
          half_trip = False
          
      if not half_trip:    
        start_trip = min(myDict, key=int)
        end_trip = max(myDict, key=int)
        orig_taz = myDict[start_trip].split(",")[0]
        dest_taz = myDict[end_trip].split(",")[1]
        value = orig_taz + "-" + dest_taz
      
      # print(value)
      gl_sum = []
      for i in range(6, 15):
        gl_sum.append(row[i])

      route_ord = []
      x = []
      str_list = []
      # 1, 3, 2
      # [10, 2, 5]
      # [10, 17, 12, 0, 0, 0, 0, 0, 0]
      # => cummusum => [10. 12. 17]
      if row[15] != None:
        for i in row[15]:
          if i not in route_ord and i != 10:
            route_ord.append(i)

        ordered_routes = []
        for i in route_ord:
          ordered_routes.append(gl_sum[i - 1])

    
        cumsum_list = list(accumulate(ordered_routes))
        cumsum = sum(ordered_routes) 
        #print(cumsum)
        x = [0]*9
        temp = 0
        for i in route_ord:
          x[i - 1] = cumsum_list[temp]
          temp = temp + 1     
        
        str_list = list(map(str, x))
        
      else:
        x = [0]*9
        str_list = list(map(str, x))
      
      
      insertQuery = r"""
      INSERT INTO cstdm_schema.additive_final
      VALUES 
      """ + "('" + value + "'," + orig_taz + "," + dest_taz + "," + ','.join(str_list) + "," + str(sum(x)) + ");"
      cursor2.execute(insertQuery)
      conn.commit()


  print('Done with script.')

if __name__ == "__main__":
  generateEcologicalFootprint()