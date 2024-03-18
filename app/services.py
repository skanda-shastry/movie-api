from app.utils import get_db
import json

def get_movies_by_year(year):
    db = get_db()
    #print(type(year))
    year_in_int = int(year)
    movies = list(db.movies.find({"year": year_in_int}))

    #print(list(movies))
    movies = json.dumps(movies, default=str)

    return movies

def get_movies_by_title(title):
    db = get_db()
    movies = list(db.movies.find({"title": title}))
    movies = json.dumps(movies, default=str)
    return movies

def get_movies_by_cast(cast):
    db = get_db()
    movies = list(db.movies.find({"cast": cast}))
    movies = json.dumps(movies, default=str)
    return movies

def get_movies_by_genre(genre):
    db = get_db()
    movies = list(db.movies.find({"genre": genre}))
    movies = json.dumps(movies, default=str)
    return movies
