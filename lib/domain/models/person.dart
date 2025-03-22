import 'package:flutter_dotenv/flutter_dotenv.dart';

class Person {
  int id;
  String name, profile, departament;

  Person({
    required this.id,
    required this.name,
    required this.profile,
    required this.departament,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      name: json['name'],
      profile: dotenv.env['BACKDROP_BASEURL'].toString() +
          (json['profile_path'] ?? ''),
      departament: json['known_for_department'],
    );
  }
}
