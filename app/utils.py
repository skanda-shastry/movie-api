from flask_pymongo import PyMongo
from flask import current_app

mongo = PyMongo()

def initialize_mongo(app, db_name):
    app.config['MONGO_DBNAME'] = db_name
    mongo.init_app(app)

def get_db():
    return mongo.db
