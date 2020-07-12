import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tindermovie/models/movie.dart';
import 'package:tindermovie/utils/blocs/favorites_bloc.dart';

import 'detail_movie_screen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FavoritesBloc favoritesBloc = Provider.of<FavoritesBloc>(context);

    void handleMovieDetailPress(Movie movie) {
      Navigator.of(context)
          .pushNamed(DetailMovieScreen.routeName, arguments: movie);
    }

    void handleRemoveAllPress() {
      favoritesBloc.removeAllFavorites();
      Navigator.pop(context);
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
        actions: <Widget>[
          IconButton(
            onPressed: handleRemoveAllPress,
            icon: Icon(Icons.delete, color: Colors.grey, size: 35),
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
              child: favoritesBloc.favorites.length > 0
                  ? Wrap(
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
                    )
                  : Padding(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("res/sad_favorites.png", width: 150,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
                            child: Text(
                              "You don't have favorites, you can discover movies, back to the home screen.",
                              style: GoogleFonts.openSansCondensed(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
