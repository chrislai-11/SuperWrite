HOST = '127.0.0.1'
PORT = '5000'
DATABASE = 'superwrite'
USERNAME = 'root'
PASSWORD = 'chris123'

DB_URI = "mysql+pymysql://{username}:{password}@{host}:{port}/{db}?charset=utf8".format(username=USERNAME,password=PASSWORD, host=HOST,port=PORT, db=DATABASE)

SQLALCHEMY_DATABASE_URI = DB_URI
SQLALCHEMY_TRACK_MODIFICATIONS = False
SQLALCHEMY_ECHO = True