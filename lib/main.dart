import 'package:flutter/material.dart';
import 'package:movie_app/data/services/movie_service.dart';
import 'package:movie_app/ui/homepage/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: const MyApp(),
      ),
    ),
  );
  MovieService movieService = MovieService();
  movieService.example();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceInfo = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(
          left: deviceInfo.width * 0.05,
          right: deviceInfo.width * 0.05,
          top: deviceInfo.width * 0.05,
        ),
        color: Color.fromRGBO(31, 31, 31, 1),
        height: deviceInfo.height,
        width: deviceInfo.width,
        child: Homepage());
  }
}
