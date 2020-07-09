import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:localstorage/localstorage.dart';
import 'package:tindermovie/models/movie.dart';
import 'package:tindermovie/utils/database.dart';


class FavoritesBloc extends ChangeNotifier {
  List<Movie> _favorites = [];
  List<Movie> get favorites => _favorites;

  void init(){
    DatabaseUtil.getFavoritesMovies().then((movies) => _favorites = movies);
  }

  void addFavorite(Movie movie){
    _favorites.add(movie);
    notifyListeners();
    DatabaseUtil.addMovieToFavorite(movie);
  }

  void removeFavorite(Movie movie){
    _favorites.remove(movie);
    notifyListeners();
    DatabaseUtil.removeMovieToFavorite(movie);
  }

  void removeAllFavorites(){
    _favorites = [];
    DatabaseUtil.removeAll();
  }

  bool isFavorite(Movie movie){
    return _favorites.contains(movie);
  }
}
