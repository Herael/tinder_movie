import 'package:flutter/material.dart';
import 'package:tindermovie/models/movie.dart';

class FavoritesBloc extends ChangeNotifier {
  List<Movie> _favorites = [];
  List<Movie> get favorites => _favorites;
  
  addFavorite(Movie movie){
    _favorites.add(movie);
  }

  removeFavorite(Movie movie){

  }
}