import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNotification extends StatelessWidget {

  final Color iconColor;
  final IconData icon;
  final String title;

  const CustomNotification({
    Key key,
    this.title,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              icon,
              color: iconColor,
              size: 25,
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: GoogleFonts.oswald(
                fontSize: 20,
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
