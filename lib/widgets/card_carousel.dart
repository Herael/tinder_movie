import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tindermovie/models/movie.dart';
import 'package:tindermovie/screens/movie_detail_screen.dart';
import 'package:tindermovie/utils/database.dart';
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

  @override
  Widget build(BuildContext context) {

    void handleLikePress() {
      _carouselController.nextPage();
      DatabaseUtil.addMovieToFavorite(widget.movies[0]);
    }

    void handleDislikePress() {
      _carouselController.nextPage();
    }

    void handleUndoPress(){
      _carouselController.previousPage();
    }

    void handleMovieDetailPress() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MovieDetailScreen()),
      );
    }

    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              carouselController: _carouselController,
              height: 550.0,
              scrollPhysics: const NeverScrollableScrollPhysics(),
            ),
            items: widget.movies != null ? widget.movies.map((movie) {
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
                          onTap: handleMovieDetailPress,
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList() : null,
          ),
          ButtonsRow(onUndoPress: handleUndoPress, onLikePress: handleLikePress, ),
        ],
      ),
    );
  }
}
