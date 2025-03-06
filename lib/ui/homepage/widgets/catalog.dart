import 'package:flutter/material.dart';
import 'package:movie_app/ui/homepage/widgets/movie_miniature.dart';

class Catalog extends StatelessWidget {
  final List<Map> movies =
      List.generate(20, (index) => {"id": index, "name": "Product $index"})
          .toList();
  final double height;

  Catalog({required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisExtent: 300,
              maxCrossAxisExtent: 250,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: movies.length,
          itemBuilder: (BuildContext ctx, index) {
            return MovieMiniature(
              movieTitle: movies[index]['name'],
            );
          }),
    );
  }
}
