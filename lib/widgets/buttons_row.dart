import 'package:flutter/material.dart';

class ButtonsRow extends StatelessWidget {

  final Function onLikePress;

  const ButtonsRow({
    Key key,
    this.onLikePress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => onLikePress(),
            child: Material(
              color: Colors.transparent,
              shape:
                  CircleBorder(side: BorderSide(color: Colors.black12, width: 10)),
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: 50,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onLikePress(),
            child: Material(
              color: Colors.transparent,
              shape:
              CircleBorder(side: BorderSide(color: Colors.black12, width: 10)),
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Icon(
                  Icons.favorite,
                  color: Colors.green,
                  size: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
