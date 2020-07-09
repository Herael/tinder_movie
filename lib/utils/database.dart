

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tindermovie/models/movie.dart';

class DatabaseUtil {

  static openMovieDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'movie_database.db'),
      onCreate: (db, version){
        return db.execute(
          "CREATE TABLE movies(id INTEGER PRIMARY KEY, title TEXT, cover TEXT, description TEXT, date TEXT, rate TEXT)",
        );
      },
      version: 1,
    );
  }

  static  Future<void> addMovieToFavorite(Movie movie) async {
    final Database db = await openMovieDatabase();
    await db.insert(
      'movies',
      movie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static  Future<void> removeMovieToFavorite(Movie movie) async {
    final Database db = await openMovieDatabase();
    await db.delete('movies', where: 'id = ?', whereArgs: [movie.id]);
  }

  static  Future<void> removeAll() async {
    final Database db = await openMovieDatabase();
    await db.delete('movies');
  }

  static Future<List<Movie>> getFavoritesMovies() async {
    final Database db = await openMovieDatabase();
    final List<Map<String, dynamic>> movies = await db.query('movies');
    return List.generate(movies.length, (i) {
      return Movie(
        id: movies[i]['id'].toString(),
        title: movies[i]['title'].toString(),
        description: movies[i]['description'].toString(),
        cover: movies[i]['cover'].toString(),
        date: movies[i]['date'].toString(),
        rate: movies[i]['rate'].toString(),
      );
    });
  }
}