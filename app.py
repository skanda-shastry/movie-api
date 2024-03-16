from app import create_app

mongo_uri = 'mongodb://localhost:27017/'
db_name = 'movie_db'
app = create_app(mongo_uri, db_name)

if __name__ == '__main__':
    app.run(debug=True)

