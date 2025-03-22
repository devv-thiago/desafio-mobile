import 'package:flutter/material.dart';
import 'package:movie_app/ui/core/colors.dart';
import 'package:movie_app/ui/core/fonts.dart';

class GenreButton extends StatelessWidget {
  final String genreTitle;
  final Size deviceInfo;

  const GenreButton({
    required this.deviceInfo,
    required this.genreTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        genreTitle,
        style: (genreTitle.length < 9)
            ? AppFontStyle.lightLarge
            : AppFontStyle.lightMedium,
      ),
    );
  }
}
