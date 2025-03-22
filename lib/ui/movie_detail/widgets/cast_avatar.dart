import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/person.dart';
import 'package:movie_app/ui/core/fonts.dart';

class CastAvatar extends StatelessWidget {
  final Person person;
  final Size deviceInfo;

  const CastAvatar({
    required this.deviceInfo,
    required this.person,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: deviceInfo.height * 0.1,
              height: deviceInfo.width * 0.1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(person.profile),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Text(
            person.name,
            style: AppFontStyle.lightMedium,
          ),
        ],
      ),
    );
  }
}
