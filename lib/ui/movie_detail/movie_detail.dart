import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/domain/models/movie.dart';
import 'package:movie_app/ui/core/colors.dart';
import 'package:movie_app/ui/core/fonts.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  const MovieDetail({
    required this.movie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size deviceInfo = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: deviceInfo.height,
          width: deviceInfo.width,
          decoration: BoxDecoration(
            color: AppColors.background,
          ),
          child: Column(
            children: [
              SizedBox(
                width: deviceInfo.width,
                child: Opacity(
                  opacity: 0.5,
                  child: Image.network(
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
              ),
              Text(
                movie.title,
                style: AppFontStyle.lightLarge,
              ),
              Text(
                DateFormat('dd/MM/yyyy')
                    .format(DateTime.parse(movie.releaseDate)),
                style: AppFontStyle.lightLarge,
              ),
              Text(
                movie.synopsis,
                style: AppFontStyle.lightLarge,
              ),
              Text(
                movie.evaluation.toStringAsFixed(1),
                style: AppFontStyle.lightLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
