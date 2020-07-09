import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tindermovie/models/movie.dart';
import 'package:tindermovie/utils/blocs/favorites_bloc.dart';
import 'package:tindermovie/widgets/buttons_row.dart';

class DetailMovieScreen extends StatefulWidget {
  static const String routeName = "routeDetailMovie";

  final Movie movie;

  const DetailMovieScreen({
    Key key,
    this.movie,
  }) : super(key: key);

  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final FavoritesBloc favoritesBloc = Provider.of<FavoritesBloc>(context);
    if(favoritesBloc.isFavorite(widget.movie)){
      print("Il est favori");
      setState(() {
        isFavorite = true;
      });
    } else {
      print("Il est pas favori");
      setState(() {
        isFavorite = false;
      });
    }

    void handleStarPress(){
      if(isFavorite){
        favoritesBloc.removeFavorite(widget.movie);
        setState(() {
          isFavorite = false;
        });
      } else {
        favoritesBloc.addFavorite(widget.movie);
        setState(() {
          isFavorite = true;
        });
      }
    }

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
        title: Text(
          "Movie detail",
          style: GoogleFonts.bebasNeue(fontSize: 30, color: Colors.orange),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: handleStarPress,
            icon: Icon(isFavorite ? Icons.star : Icons.star_border, color: Colors.orange, size: 35),
          ),
        ],
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
                  Image.network(widget.movie.cover, height: height * 0.7),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Wrap(
                      children: [
                        Text(
                          widget.movie.title,
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
                              widget.movie.rate,
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
                              widget.movie.date,
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
                      widget.movie.description,
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
