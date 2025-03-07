import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/genre.dart';
import 'package:movie_app/ui/homepage/widgets/movie_miniature.dart';

class GenresCatalog extends StatelessWidget {
  final double height;
  final List<Genre> genres;

  const GenresCatalog(this.genres, {required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: Column(
          spacing: 10,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              height: height * 0.2,
              child: Text(
                'Gêneros',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.75,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: genres.length,
                  itemBuilder: (context, index) => MovieMiniature.title(
                      width: height * 0.6, movieTitle: genres[index].name)),
            )
          ],
        ));
  }
}
