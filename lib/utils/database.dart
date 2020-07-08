

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

  static Future<List<Movie>> getFavoritesMovies() async {
    final Database db = await openMovieDatabase();
    final List<Map<String, dynamic>> maps = await db.query('movies');
    return List.generate(maps.length, (i) {
      print(i);
      return Movie(
        id: maps[i]['id'],
        title: maps[i]['name'],
        description: maps[i]['description'],
        cover: maps[i]['cover'],
        date: maps[i]['date'],
        rate: maps[i]['rate'],
      );
    });
  }
}