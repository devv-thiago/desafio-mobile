import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/domain/models/movie.dart';
import 'package:movie_app/ui/core/colors.dart';
import 'package:movie_app/ui/core/fonts.dart';

class MovieMiniature extends StatelessWidget {
  final Size deviceInfo;
  final Movie movie;

  const MovieMiniature({
    required this.movie,
    required this.deviceInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.goNamed('/movie_detail',extra: movie),
      child: Container(
        decoration: BoxDecoration(),
        width: deviceInfo.width,
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: Image.network(
                fit: BoxFit.fill,
                movie.poster,
                headers: {
                  "accept": "application/json",
                  "Authorization": "Bearer ${dotenv.env['API_KEY']}"
                },
                errorBuilder: (context, widget, stack) {
                  return SizedBox(
                    child: Center(
                      child: Text(
                        'No Poster',
                        style: AppFontStyle.lightLarge,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: deviceInfo.width,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.color1, width: 1)),
              child: Text(
                DateFormat('dd/MM/yyyy').format(DateTime.parse(movie.releaseDate)),
                style: AppFontStyle.lightMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
