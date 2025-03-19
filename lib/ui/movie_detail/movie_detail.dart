import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/movie.dart';
import 'package:movie_app/ui/core/colors.dart';

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
      ),
      ], 
    );
  }
}
