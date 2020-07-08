import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardContent extends StatelessWidget {
  final String cardTitle;
  final String cover;
  final String date;
  final String rate;
  final Function onTap;

  const CardContent({
    Key key,
    this.cardTitle,
    this.cover,
    this.date,
    this.rate,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        child: Column(
          children: [
            Image.network(cover, height: 436),
            Padding(
              padding: EdgeInsets.all(10),
              child: Wrap(
                children: [
                  Text(
                    cardTitle,
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
                        rate,
                        style: GoogleFonts.openSansCondensed(fontSize: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                        date,
                        style: GoogleFonts.openSansCondensed(fontSize: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
            )
          ],
        ),
      ),
    );
  }
}
