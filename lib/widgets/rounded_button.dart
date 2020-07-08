import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final Function onTap;
  final Color color;
  final IconData icon;
  final double iconSize;
  final double padding;

  const RoundedButton({
    Key key,
    this.onTap,
    this.color,
    this.icon,
    this.iconSize,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Material(
          color: Colors.transparent,
          shape:
          CircleBorder(side: BorderSide(color: Colors.black12, width: 10)),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Icon(
              icon,
              color: color,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
