import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/data/controllers/genre_controller.dart';
import 'package:movie_app/data/controllers/movie_controller.dart';
import 'package:movie_app/domain/models/movie.dart';
import 'package:movie_app/ui/core/colors.dart';
import 'package:movie_app/ui/core/fonts.dart';
import 'package:movie_app/ui/core/widgets/genre_list.dart';
import 'package:movie_app/ui/movie_detail/widgets/cast_list.dart';
import 'package:provider/provider.dart';

class MovieDetail extends StatelessWidget {
  final MovieController _movieController = MovieController();

  final Movie movie;
  MovieDetail({
    required this.movie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size deviceInfo = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: deviceInfo.height,
            width: deviceInfo.width,
            decoration: BoxDecoration(
              color: AppColors.background2,
            ),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: 250,
                      width: deviceInfo.width,
                      child: Image.network(
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;

                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.color2,
                            ),
                          );
                        },
                        fit: BoxFit.fill,
                        movie.backdrop,
                        headers: {
                          "accept": "application/json",
                          "Authorization": "Bearer ${dotenv.env['API_KEY']}"
                        },
                        errorBuilder: (context, widget, stack) {
                          return SizedBox(
                            child: Center(
                              child: Text(
                                'No backdrop',
                                style: AppFontStyle.lightLarge,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: deviceInfo.width * 0.02,
                        bottom: deviceInfo.width * 0.03,
                      ),
                      child: Column(
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              SizedBox(
                                width: deviceInfo.width * 0.4,
                                child: Text(
                                  movie.title,
                                  style: AppFontStyle.lightTitle,
                                ),
                              ),
                              Text(
                                " | ",
                                style: AppFontStyle.lightTitle,
                              ),
                              Text(
                                DateFormat('yyyy')
                                    .format(DateTime.parse(movie.releaseDate)),
                                style: AppFontStyle.lightTitle,
                              ),
                            ],
                          ),
                          Row(
                            spacing: 8,
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.color3,
                                size: 35,
                              ),
                              Text(
                                movie.evaluation.toStringAsFixed(1),
                                style: AppFontStyle.lightTitle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: deviceInfo.width * 0.04,
                  ),
                  child: SizedBox(
                    height: deviceInfo.height * 0.1,
                    child: GenresList(
                      viewTitle: false,
                      deviceInfo: deviceInfo,
                      genres: context
                          .read<GenreController>()
                          .genres
                          .where((gen) => movie.genres.contains(gen.id))
                          .toList(),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: deviceInfo.width * 0.04),
                  child: Divider(
                    height: deviceInfo.height * 0.05,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: deviceInfo.width * 0.04),
                  child: SizedBox(
                    height: deviceInfo.height * 0.28,
                    child: SingleChildScrollView(
                      child: Text(
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        movie.synopsis,
                        style: AppFontStyle.lightLarge,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: deviceInfo.width * 0.04),
                  child: Divider(
                    height: deviceInfo.height * 0.01,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    "Elenco",
                    style: AppFontStyle.lightTitle,
                  ),
                ),
                FutureBuilder(
                    future: _movieController.fetchMovieCast(movie.id),
                    builder: (context, snapshot) {
                      return (snapshot.connectionState == ConnectionState.done)
                          ? CastList(
                              cast: _movieController.cast,
                              deviceInfo: deviceInfo,
                            )
                          : CircularProgressIndicator(color: AppColors.color2);
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
