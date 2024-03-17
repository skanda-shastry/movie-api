from flask_pymongo import PyMongo

mongo = PyMongo()

def initialize_mongo(app, db_name):
    print('Initializing Mongo')
    app.config['MONGO_DBNAME'] = db_name
    mongo.init_app(app)


def get_db():
    return mongo.db
