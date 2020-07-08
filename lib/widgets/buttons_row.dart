import 'package:flutter/material.dart';
import 'package:tindermovie/models/movie.dart';
import 'package:tindermovie/widgets/rounded_button.dart';

class ButtonsRow extends StatelessWidget {

  final Function onUndoPress;
  final Function onLikePress;
  final Function onDislikePress;
  final Function onDetailPress;

  const ButtonsRow({
    Key key,
    this.onUndoPress,
    this.onLikePress,
    this.onDetailPress,
    this.onDislikePress,
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
          RoundedButton(onTap: onDislikePress, color: Colors.red, icon: Icons.close, iconSize: 50, padding: 30),
          RoundedButton(onTap: onLikePress, color: Colors.green, icon: Icons.favorite, iconSize: 50, padding: 30),
          RoundedButton(onTap: onDetailPress, color: Colors.orange, icon: Icons.info, iconSize: 25, padding: 20.0),
        ],
      ),
    );
  }
}
