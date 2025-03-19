import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/ui/core/colors.dart';
import 'package:movie_app/ui/core/fonts.dart';

class MovieMiniature extends StatelessWidget {
  final String movieTitle, image, releaseDate;
  final Size deviceInfo;

  const MovieMiniature({
    required this.deviceInfo,
    required this.releaseDate,
    required this.image,
    super.key,
  }) : movieTitle = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      width: deviceInfo.width,
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: Image.network(
              fit: BoxFit.fill,
              image,
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
                color: Colors.transparent,
                border: Border.all(color: AppColors.color1, width: 1)),
            child: Text(
              DateFormat('dd/MM/yyyy').format(DateTime.parse(releaseDate)),
              style: AppFontStyle.lightMedium,
            ),
          )
        ],
      ),
    );
  }
}
