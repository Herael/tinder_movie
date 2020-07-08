import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tindermovie/api/index.dart';
import 'package:tindermovie/models/movie.dart';
import 'package:tindermovie/screens/favorites_screen.dart';
import '../widgets/card_carousel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies;

  @override
  void initState() {
    super.initState();
    Api.fetchMovies(1).then((data) => setState(() {
          movies = data;
        }));
  }

  void handleFavoritesPress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FavoritesScreen()),
    );
  }

  void refreshMovies(){
    Api.fetchMovies(next(0, 500)).then((data) => setState(() {
      movies = data;
    }));
  }

  final _random = new Random();
  int next(int min, int max) => min + _random.nextInt(max - min);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Tinder Movie",
          style: TextStyle(
            color: Colors.deepOrangeAccent,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: handleFavoritesPress,
            icon: Icon(Icons.apps, color: Colors.grey, size: 35),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          CardCarousel(movies: movies, refreshMovies: refreshMovies),
        ],
      ),
    );
  }
}
