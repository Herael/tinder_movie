import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:tindermovie/models/movie.dart';
import 'package:tindermovie/screens/detail_movie_screen.dart';
import 'package:tindermovie/utils/blocs/favorites_bloc.dart';
import 'package:tindermovie/widgets/buttons_row.dart';
import 'package:tindermovie/widgets/card_content.dart';

class CardCarousel extends StatefulWidget {
  final List<Movie> movies;

  const CardCarousel({
    Key key,
    this.movies,
  }) : super(key: key);

  @override
  _CardCarouselState createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  final CarouselController _carouselController = CarouselController();
  int activeCarouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    final FavoritesBloc favoritesBloc = Provider.of<FavoritesBloc>(context);

    void handleLikePress() {
      _carouselController.nextPage();
      favoritesBloc.addFavorite(widget.movies[activeCarouselIndex]);
      setState(() {
        if(activeCarouselIndex < widget.movies.length - 1) {
          activeCarouselIndex++;
        }
      });
    }

    void handleDislikePress() {
      _carouselController.nextPage();
    }

    void handleUndoPress() {
      _carouselController.previousPage();
      setState(() {
        if(activeCarouselIndex > 0) {
          activeCarouselIndex--;
        }
      });
    }

    void handleMovieDetailPress(Movie movie) {
      Navigator.of(context)
          .pushNamed(DetailMovieScreen.routeName, arguments: movie);
    }

    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              carouselController: _carouselController,
              enableInfiniteScroll: false,
              height: height*0.75,
              scrollPhysics: const NeverScrollableScrollPhysics(),
            ),
            items: widget.movies != null
                ? widget.movies.map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x1a000000),
                                blurRadius: 15,
                                spreadRadius: 5,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              CardContent(
                                cardTitle: movie.title,
                                cover: movie.cover,
                                date: movie.date,
                                rate: movie.rate,
                                onTap: () => handleMovieDetailPress(movie),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList()
                : null,
          ),
          ButtonsRow(
            onUndoPress: handleUndoPress,
            onLikePress: handleLikePress,
            onDislikePress: handleDislikePress,
            onDetailPress: () => handleMovieDetailPress(widget.movies[activeCarouselIndex]),
          ),
        ],
      ),
    );
  }
}
