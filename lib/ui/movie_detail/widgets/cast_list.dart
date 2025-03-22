import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/cast.dart';
import 'package:movie_app/ui/movie_detail/widgets/cast_avatar.dart';

class CastList extends StatelessWidget {
  final Cast cast;
  final Size deviceInfo;
  const CastList({
    required this.cast,
    required this.deviceInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceInfo.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cast.movieCast.length,
        itemBuilder: (context, index) => CastAvatar(
          person: cast.movieCast[index],
          deviceInfo: deviceInfo,
        ),
      ),
    );
  }
}
