import 'package:flutter/material.dart';
import 'package:tindermovie/models/movie.dart';
import 'package:tindermovie/utils/database.dart';
import 'package:tindermovie/widgets/card_carousel.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Movie> movies;

  @override
  void initState() {
    super.initState();
    DatabaseUtil.getFavoritesMovies().then((data) => setState(() {
      movies = data;
      print(movies);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () { Navigator.pop(context); },
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
        ),
        title: const Text(
          "Description",
          style: TextStyle(
            color: Colors.deepOrangeAccent,
          ),
        ),
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
