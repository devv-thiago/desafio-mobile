import 'package:flutter_dotenv/flutter_dotenv.dart';

class Person {
  int id;
  String name, profile;

  Person({
    required this.id,
    required this.name,
    required this.profile,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      name: json['name'],
      profile: dotenv.env['POSTER_BASEURL'].toString() +
          (json['profile_path'] ?? ''),
    );
  }
}
