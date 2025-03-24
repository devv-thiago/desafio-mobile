import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/genre.dart';
import 'package:movie_app/ui/core/fonts.dart';
import 'package:movie_app/ui/core/widgets/genre_button.dart';

class GenresList extends StatelessWidget {
  final bool viewTitle;
  final Size deviceInfo;
  final List<Genre> genres;

  const GenresList({
    required this.viewTitle,
    required this.genres,
    required this.deviceInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceInfo.height * 0.14,
      child: Column(
        spacing: deviceInfo.height * 0.01,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          viewTitle
              ? Padding(
                  padding: EdgeInsets.only(left: deviceInfo.width * 0.05),
                  child: Text(
                    'Gêneros',
                    style: AppFontStyle.lightTitle,
                  ),
                )
              : SizedBox(),
          SizedBox(
            height: deviceInfo.height * 0.08,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: genres.length,
              itemBuilder: (context, index) => GenreButton(
                deviceInfo: deviceInfo,
                genre: genres[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
