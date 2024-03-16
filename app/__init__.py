from flask import Flask
from app.utils.mongo_utils import initialize_mongo
from app.controllers.movie_controller import movie_bp
from app.controllers.error_controller import error_bp

def create_app(mongo_uri, db_name):
    app = Flask(__name__)
    app.config['MONGO_URI'] = mongo_uri

    initialize_mongo(app,db_name)

    app.register_blueprint(movie_bp)
    app.register_blueprint(error_bp)

    return app
