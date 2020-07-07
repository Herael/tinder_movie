import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tindermovie/widgets/buttons_row.dart';
import 'package:tindermovie/widgets/card_content.dart';

class CardCarousel extends StatefulWidget {
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
            items: [1, 2, 3, 4, 5].map((i) {
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
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: Offset(-10, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CardContent(
                          cardTitle: "Amélie Poulain",
                          cover: "res/amelie.jpg",
                          date: "20/06/2019",
                          rate: "6.1",
                        ),
                      ],
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
