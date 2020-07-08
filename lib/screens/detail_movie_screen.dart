import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
        ),
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
                  Image.network(movie.cover, width: double.infinity, height: 550),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Wrap(
                      children: [
                        Text(
                          movie.title,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.oswald(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Text(
                              movie.rate,
                              style:
                                  GoogleFonts.openSansCondensed(fontSize: 15),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Text(
                              movie.date,
                              style:
                                  GoogleFonts.openSansCondensed(fontSize: 15),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.orange,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
                    child: Text(
                      movie.description,
                      style: GoogleFonts.quicksand(fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
