import 'package:flutter/material.dart';
import 'package:movie_app/data/controllers/genre_controller.dart';
import 'package:movie_app/domain/models/genre.dart';
import 'package:movie_app/ui/core/colors.dart';
import 'package:movie_app/ui/core/fonts.dart';
import 'package:movie_app/ui/core/widgets/movie_miniature.dart';

class GenreMovies extends StatelessWidget {
  final Genre genre;
  const GenreMovies({
    required this.genre,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size deviceInfo = MediaQuery.of(context).size;
    final GenreController genreController = GenreController();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: deviceInfo.width * 0.1,
        ),
        color: AppColors.background,
        height: deviceInfo.height,
        width: deviceInfo.width,
        child: FutureBuilder(
            future: genreController.fetchGenreMovies(genre.id),
            builder: (context, snapshot) {
              return (snapshot.connectionState == ConnectionState.done)
                  ? Column(
                      children: [
                        Center(
                            child: Text(
                          genre.name,
                          style: AppFontStyle.lightTitle,
                        )),
                        SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: deviceInfo.height * 0.02,
                                right: deviceInfo.height * 0.02),
                            height: deviceInfo.height * 0.9,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.55,
                                crossAxisSpacing: 30,
                                mainAxisSpacing: 30,
                              ),
                              itemCount: genreController.catalog.movies.length,
                              itemBuilder: (context, index) => MovieMiniature(
                                movie: genreController.catalog.movies[index],
                                deviceInfo: deviceInfo,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(
                      color: AppColors.color2,
                    ));
            }),
      ),
    );
  }
}
