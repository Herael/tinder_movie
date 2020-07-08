

import 'dart:convert';

import 'package:tindermovie/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {

  static Future<List<Movie>> fetchMovies(int page) async {
    final response = await http.get(
        'https://api.themoviedb.org/3/discover/movie?api_key=9152da056e42a68ab9f559eaf926a48e&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=' + page.toString());

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      return (responseJson["results"] as List)
          .map((json) => Movie.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}