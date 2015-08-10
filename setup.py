from sqlalchemy import create_engine
import pandas as pd

engine = create_engine('postgresql://postgres:postgres@localhost/cstdm_db')
df = pd.read_excel('C:\Users\abharadw\Desktop\freeflow.csv')
df.to_sql('pandas_db', engine)