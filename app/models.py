from datetime import datetime

class Movie:
    def __init__(self, title, year, cast, genre):
        self.title = title
        self.year = year
        self.cast = cast
        self.genre = genre
        self.created_at = datetime.now()
