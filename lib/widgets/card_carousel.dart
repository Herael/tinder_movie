import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CardCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 48.0),
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: 500.0,
              scrollPhysics: const NeverScrollableScrollPhysics(),
            ),
            items: [1,2,3,4,5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset('res/amelie.jpg', height: 400, width: 400),
                            const Text("Amelie")
                          ],
                        ),
                      )
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
