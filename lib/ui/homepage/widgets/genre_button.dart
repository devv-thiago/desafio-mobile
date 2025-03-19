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
        right: 10,
        left: 10,
      ),
      width: deviceInfo.width * 0.3,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.color1, width: 1),
        color: AppColors.color2,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        genreTitle,
        style: AppFontStyle.lightLarge,
      ),
    );
  }
}
