from app.utils.mongo_utils import get_db

def get_movies_by_year(year):
    db = get_db()
    movies = list(db.movies.find({"year": year}))
    return movies

def get_movies_by_title(title):
    db = get_db()
    movies = list(db.movies.find({"title": title}))
    return movies

def get_movies_by_cast(cast):
    db = get_db()
    movies = list(db.movies.find({"cast": cast}))
    return movies

def get_movies_by_genre(genre):
    db = get_db()
    movies = list(db.movies.find({"genre": genre}))
    return movies
