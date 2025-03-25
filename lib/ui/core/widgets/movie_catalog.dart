import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/catalog.dart';
import 'package:movie_app/ui/core/widgets/movie_miniature.dart';

class MovieCatalog extends StatelessWidget {
  final Size deviceInfo;
  final Catalog catalog;
  const MovieCatalog({
    required this.deviceInfo,
    required this.catalog,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            left: deviceInfo.height * 0.02, right: deviceInfo.height * 0.02),
        height: deviceInfo.height * 0.6,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.55,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
          ),
          itemCount: catalog.movies.length,
          itemBuilder: (context, index) => MovieMiniature(
            movie: catalog.movies[index],
            deviceInfo: deviceInfo,
          ),
        ),
      ),
    );
  }
}
