import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tindermovie/utils/blocs/favorites_bloc.dart';
import 'package:tindermovie/widgets/card_carousel.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FavoritesBloc favoritesBloc = Provider.of<FavoritesBloc>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
        ),
        title: const Text(
          "Description",
          style: TextStyle(
            color: Colors.deepOrangeAccent,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Wrap(
        children: favoritesBloc.favorites
            .map(
              (movie) => Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 3),
                  child: Image.network(movie.cover, width: 100)),
            )
            .toList(),
      ),
    );
  }
}
