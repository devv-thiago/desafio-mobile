import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/domain/models/genre.dart';
import 'package:movie_app/ui/core/colors.dart';
import 'package:movie_app/ui/core/fonts.dart';

class GenreButton extends StatelessWidget {
  final Genre genre;
  final Size deviceInfo;

  const GenreButton({
    required this.deviceInfo,
    required this.genre,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.goNamed('/genre_movies',extra: genre),
      child: Container(
        margin: EdgeInsets.only(
          right: deviceInfo.width * 0.02,
          left: deviceInfo.width * 0.02,
        ),
        width: deviceInfo.width * 0.3,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.color1, width: 1),
          color: AppColors.color2,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          textAlign: TextAlign.center,
          softWrap: true,
          genre.name,
          style: (genre.name.length < 9)
              ? AppFontStyle.lightLarge
              : AppFontStyle.lightMedium,
        ),
      ),
    );
  }
}
