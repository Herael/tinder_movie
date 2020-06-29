import 'package:flutter/material.dart';

class buttonsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 48.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            mini: true,
            onPressed: () {},
            backgroundColor: Colors.white,
            child: Icon(
              Icons.description,
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
          ),
          FloatingActionButton(
            mini: true,
            onPressed: () {},
            backgroundColor: Colors.white,
            child: Icon(
              Icons.close,
              color: Colors.red,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
          ),
          FloatingActionButton(
            mini: true,
            onPressed: () {},
            backgroundColor: Colors.white,
            child: Icon(
              Icons.favorite,
              color: Colors.green,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
          ),
          FloatingActionButton(
            mini: true,
            onPressed: () {},
            backgroundColor: Colors.white,
            child: Icon(
              Icons.star,
              color: Colors.yellow,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
          ),
        ],
      ),
    );
  }
}
