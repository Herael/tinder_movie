import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tindermovie/models/movie.dart';
import 'package:tindermovie/utils/blocs/favorites_bloc.dart';
import 'package:tindermovie/widgets/card_carousel.dart';

import 'detail_movie_screen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FavoritesBloc favoritesBloc = Provider.of<FavoritesBloc>(context);

    void handleMovieDetailPress(Movie movie) {
      Navigator.of(context)
          .pushNamed(DetailMovieScreen.routeName, arguments: movie);
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
          "Favorites",
          style: GoogleFonts.bebasNeue(fontSize: 30, color: Colors.orange),
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
              child: Wrap(
                children: favoritesBloc.favorites
                    .map(
                      (movie) => GestureDetector(
                        onTap: () => handleMovieDetailPress(movie),
                        child: Padding(
                          padding: EdgeInsets.only(left: 3, bottom: 3),
                          child: Image.network(movie.cover, width: 100),
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
