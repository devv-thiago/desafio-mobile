import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/person.dart';

class CastAvatar extends StatelessWidget {
  final Person person;
  final Size deviceInfo;
  const CastAvatar(
    this.deviceInfo, {
    required this.person,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceInfo.height * 0.1,
      child: CircleAvatar(
        backgroundImage: NetworkImage(person.profile),
        radius: 100,
      ),
    );
  }
}
