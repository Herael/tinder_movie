import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tindermovie/models/movie.dart';
import 'package:tindermovie/screens/detail_movie_screen.dart';
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
    void _handleLikePress() {
      print("test");
      _carouselController.nextPage();
    }

    void _handleDislikePress() {
      print("test");
      _carouselController.nextPage();
    }

    void _goTo(BuildContext context, String name, {dynamic argument}) {
      Navigator.of(context).pushNamed(name, arguments: argument);
    }

    print(widget.movies);

    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              carouselController: _carouselController,
              height: 520.0,
              scrollPhysics: const NeverScrollableScrollPhysics(),
            ),
            items: widget.movies.map((movie) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () => _goTo(context, DetailMovieScreen.routeName, argument: movie),
                    child: Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x1a000000),
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: Offset(-10, 10),
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
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          ButtonsRow(onLikePress: _handleLikePress)
        ],
      ),
    );
  }
}
