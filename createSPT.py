import psycopg2
import psycopg2.extras
import sys
import pprint

def createMegaTable():

  # Define connection string
  conn_string = "host='localhost' dbname='mtc_db' user='postgres' password='postgres'"
  
  # get a connection, if a connect cannot be made an exception will be raised here
  conn = psycopg2.connect(conn_string)

  # conn.cursor will return a cursor object, you can use this cursor to perform queries
  cursor = conn.cursor()

  for i in range(1, 1455):
    listOfTuples = []
    for j in range(1, 1455):
      # execute the shortest path query
      shortestPathQuery = r"""
      SELECT countyid, COALESCE(total_cost, 0) AS total_cost FROM
      (
      SELECT "GL", SUM(cost) AS total_cost
      FROM cstdm_schema.freeflow
      INNER JOIN
      (
      SELECT source, target, cstdm_schema.edge_table.cost
      FROM pgr_dijkstra('SELECT id, source, target, cost FROM cstdm_schema.edge_table' , 
      """ + str(i) + "," + str(j) + ", false, false)"
      shortestPathQuery += r"""
      INNER JOIN cstdm_schema.edge_table ON (id2 = id)
      ) AS R1
      ON (R1.source = "A") AND (R1.target = "B")
      GROUP BY "GL"
      ) AS R2
      FULL JOIN cstdm_schema.countynames
      ON (countyid = "GL");
      """

      cursor.execute(shortestPathQuery)

      # retrieve the records from the database
      records = cursor.fetchall()
      
      listOfTuples.append((i,j,records[0][1],records[1][1], records[2][1], records[3][1], records[4][1], records[5][1], records[6][1], records[7][1], records[8][1]))
      
    
    #args_str = ",".join([str(s) for s in listOfTuples])
    #cursor.execute("INSERT INTO cstdm_schema.mega_table VALUES " +  args_str)
    #print(pprint.pprint(listOfTuples))
    args_str = ','.join(['%s' for t in listOfTuples])
    insert_query = 'INSERT INTO cstdm_schema.mega_table VALUES {0}'.format(args_str)
    cursor.execute(insert_query, listOfTuples)
    print(str(i) + "ith insert done")
    conn.commit()


if __name__ == "__main__":
  createMegaTable()