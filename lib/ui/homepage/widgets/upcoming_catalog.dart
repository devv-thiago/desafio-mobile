import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/catalog.dart';
import 'package:movie_app/ui/homepage/widgets/movie_miniature.dart';

class UpcomingCatalog extends StatelessWidget {
  final double height;
  final Catalog catalog;
  const UpcomingCatalog(this.height, this.catalog, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: height * 0.02, right: height * 0.02),
        height: height,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.55,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
          ),
          itemCount: catalog.movies.length,
          itemBuilder: (context, index) => MovieMiniature.image(
            releaseDate: catalog.movies[index].releaseDate,
            image: catalog.movies[index].poster,
            width: height,
          ),
        ),
      ),
    );
  }
}
