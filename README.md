# movie-api
GET API implementation for the movie data

```
    /movies?year=<year>
    /movies?title=<movie name>
    /movies?cast=<cast member>
    /movies?genre=<genre>
```


This API provides endpoints to retrieve movie data based on various parameters.

Endpoints:

    /movies?year=<year>         # Get movies released in a specific year.
    /movies?title=<movie_name>  # Get a movie by its title.
    /movies?cast=<cast_member>  # Get movies featuring a specific cast member.
    /movies?genre=<genre>       # Get movies of a particular genre.

To use this API, send a GET request to the desired endpoint with the corresponding parameter:
```
    Example: /movies?year=2020
    Example: /movies?title=Inception
    Example: /movies?cast=Leonardo DiCaprio
    Example: /movies?genre=Action
```

The API returns movie data in JSON format. Each movie object includes attributes like title, year, cast, and genre.

Example Response:

```

{
  "movies": [
    {
      "title": "Inception",
      "year": 2010,
      "cast": ["Leonardo DiCaprio", "Joseph Gordon-Levitt"],
      "genre": "Action"
    },
    {
      "title": "The Matrix",
      "year": 1999,
      "cast": ["Keanu Reeves", "Carrie-Anne Moss"],
      "genre": "Sci-Fi"
    }
  ]
}
```
Dependencies:

This API is built using Python Flask and requires the following dependencies in the requirement.txt:
```
    Flask
    Flask-PyMongo 
```


Clone this repository.
Run the Flask app using the below command:

```
    /usr/bin/python3 -m venv venv
    source ./venv/bin/activate
    pip install -r requirement.txt
    python3 app.py
```

Access the API endpoints as mentioned above 

