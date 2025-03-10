import 'package:flutter/material.dart';

class MovieMiniature extends StatelessWidget {
  final String movieTitle, image;
  final double width;

  const MovieMiniature.title({
    required this.width,
    required this.movieTitle,
    super.key,
  }) : image = '';

  const MovieMiniature.image({
    required this.width,
    required this.image,
    super.key,
  }) : movieTitle = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 10,
        left: 10,
      ),
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue[200]!,
            Colors.blue[500]!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        movieTitle.isNotEmpty ? movieTitle : 'Sem título',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          fontSize: 18,
        ),
      ),
    );
  }
}
