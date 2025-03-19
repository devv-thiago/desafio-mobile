import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/catalog.dart';
import 'package:movie_app/ui/homepage/widgets/movie_miniature.dart';

class UpcomingCatalog extends StatelessWidget {
  final Size deviceInfo;
  final Catalog catalog;
  const UpcomingCatalog({
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
        height: deviceInfo.height * 0.68,
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
