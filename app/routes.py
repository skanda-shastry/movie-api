from flask import Blueprint, request, jsonify
from app.services.movie_service import (
    get_movies_by_year,
    get_movies_by_title,
    get_movies_by_cast,
    get_movies_by_genre,
)

movie_bp = Blueprint('movie', __name__)

@movie_bp.route('/movies', methods=['GET'])
def get_movies():
    year = request.args.get('year')
    title = request.args.get('title')
    cast = request.args.get('cast')
    genre = request.args.get('genre')

    if year:
        movies = get_movies_by_year(year)
    elif title:
        movies = get_movies_by_title(title)
    elif cast:
        movies = get_movies_by_cast(cast)
    elif genre:
        movies = get_movies_by_genre(genre)
    else:
        return jsonify({'error': 'Invalid query parameter'}), 400

    return jsonify({'movies': movies}), 200
