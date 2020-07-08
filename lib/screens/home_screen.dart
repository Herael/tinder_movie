import 'dart:convert';

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
    Api.fetchMovies().then((data) => setState(() {
          movies = data;
        }));
  }

  void handleFavoritesPress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FavoritesScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings, color: Colors.grey),
        ),
        title: const Text(
          "Tinder Movie",
          style: TextStyle(
            color: Colors.deepOrangeAccent,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: handleFavoritesPress,
            icon: Icon(Icons.star, color: Colors.grey),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          CardCarousel(movies: movies),
        ],
      ),
    );
  }
}
