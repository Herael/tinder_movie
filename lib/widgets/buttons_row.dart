import 'package:flutter/material.dart';
import 'package:tindermovie/models/movie.dart';
import 'package:tindermovie/widgets/rounded_button.dart';

class ButtonsRow extends StatelessWidget {

  final Function onUndoPress;
  final Function onLikePress;

  const ButtonsRow({
    Key key,
    this.onUndoPress,
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
          RoundedButton(onTap: onUndoPress, color: Colors.blue, icon: Icons.undo, iconSize: 25, padding: 20.0),
          RoundedButton(onTap: onLikePress, color: Colors.red, icon: Icons.close, iconSize: 50, padding: 30),
          RoundedButton(onTap: onLikePress, color: Colors.green, icon: Icons.favorite, iconSize: 50, padding: 30),
          RoundedButton(onTap: onLikePress, color: Colors.orange, icon: Icons.info, iconSize: 25, padding: 20.0),
        ],
      ),
    );
  }
}
