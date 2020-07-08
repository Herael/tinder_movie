import 'package:flutter/material.dart';
import 'package:tindermovie/models/movie.dart';
import 'package:tindermovie/widgets/buttons_row.dart';

class DetailMovieScreen extends StatelessWidget {
  static const String routeName = "routeDetailMovie";

  final Movie movie;

  const DetailMovieScreen({
    Key key,
    this.movie,
  }) : super(key: key);

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
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: DraggableScrollableSheet(
          initialChildSize: 1.0,
          minChildSize: 1.0,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: <Widget>[
                  Image.network(movie.cover),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 10.0),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        movie.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Container(
                      width: double.infinity,
                      child: Text(
//                        movie.date,
                        "⭐️ : " + movie.rate,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        "🗓️ : " + movie.date,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 5.0, right: 20.0),
                    child: Divider(color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      child: Text(
//                        movie.description,
                        "Lorem ipsum dolor sit amet, "
                        "consectetur adipiscing elit, sed do eiusmod tempor incididunt "
                        "ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis "
                        "nostrud exercitation ullamco laboris nisi ut aliquip ex ea "
                        "commodo consequat. Duis aute irure dolor in ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  ButtonsRow(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
