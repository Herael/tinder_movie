import 'package:flutter/material.dart';
import 'buttons_row.dart';

class SwipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings, color: Colors.grey),
        ),
        title: const Text(
          "Tinder Movie",
          style: TextStyle(
            color: Colors.deepOrangeAccent,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.star, color: Colors.grey),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            color: Colors.amber,
          ),
          buttonsRow()
        ],
      ),
    );
  }
}

