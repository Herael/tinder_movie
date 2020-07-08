import 'package:flutter/material.dart';
import 'package:tindermovie/models/movie.dart';
import 'package:tindermovie/screens/Screen404.dart';
import 'package:tindermovie/screens/detail_movie_screen.dart';
import 'package:tindermovie/screens/home_screen.dart';
import 'package:tindermovie/utils/database.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinder-Movie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        "/home": (BuildContext context) => HomeScreen(),
      },
      onGenerateRoute: (RouteSettings settings) {
        final dynamic arguments = settings.arguments;
        switch (settings.name) {
          case DetailMovieScreen.routeName:
            Movie movie;
            if (arguments is Movie) {
              movie = arguments;
            }
            return MaterialPageRoute(
              builder: (BuildContext context) => DetailMovieScreen(
                movie: movie,
              ),
            );
            break;
          default:
            return MaterialPageRoute(builder: (BuildContext context) => Screen404());
            break;
        }
      },
    );
  }
}