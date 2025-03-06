import 'package:flutter/material.dart';

class MovieMiniature extends StatelessWidget {
  final String movieTitle;
  const MovieMiniature({required this.movieTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(15)),
      child: Text(movieTitle),
    );
  }
}
