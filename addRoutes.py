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

  cursor.execute("DROP TABLE IF EXISTS cstdm_schema.route_orders;")
  cursor.execute("CREATE TABLE cstdm_schema.route_orders (route_order integer[] );")
  conn.commit()
  
  for i in range(1, 1455):
    listOfTuples = []
    for j in range(1, 1455):
      # execute the shortest path query
      shortestPathQuery = r"""
      SELECT array_agg("GL") AS "county_orders" FROM
      (
      SELECT "GL" FROM
      (
      SELECT source, target, cstdm_schema.edge_table.cost
      FROM pgr_dijkstra('SELECT id, source, target, cost FROM cstdm_schema.edge_table', 
      """ + str(i) + "," + str(j) + ", false, false)"
      shortestPathQuery += r"""
      INNER JOIN cstdm_schema.edge_table ON (id2 = id)
      ) R1
      INNER JOIN cstdm_schema.freeflow ON (source = "A") AND (target = "B")
      GROUP BY "GL"
      ) R2;
      """
      #print(str(i) + "," + str(j))
      cursor.execute(shortestPathQuery)

      # retrieve the records from the database
      records = cursor.fetchall()
      
      listOfTuples.append( records[0] )
      #print(records)
      
    
    #args_str = ",".join([str(s) for s in listOfTuples])
    #cursor.execute("INSERT INTO cstdm_schema.mega_table VALUES " +  args_str)
    #print(pprint.pprint(listOfTuples))
    #print(listOfTuples)
    args_str = ','.join(['%s' for t in listOfTuples])
    insert_query = 'INSERT INTO cstdm_schema.route_orders VALUES {0}'.format(args_str)
    modifiedQuery = cursor.mogrify(insert_query, listOfTuples)
    cursor.execute(modifiedQuery)
    print(str(i) + "ith insert done")
    conn.commit()


if __name__ == "__main__":
  addRoutesToMegaTable()