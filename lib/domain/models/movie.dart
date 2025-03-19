import 'package:flutter_dotenv/flutter_dotenv.dart';

class Movie {
  int id;
  bool isAdult;
  String poster = 'No poster',
      synopsis = 'No synopsis',
      title = 'No title',
      releaseDate = '2099-12-31';
  List<dynamic> genres;
  double evaluation;

  Movie(
    this.id,
    this.isAdult,
    this.poster,
    this.genres,
    this.synopsis,
    this.releaseDate,
    this.title,
    this.evaluation,
  );

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      json['id'],
      json['adult'],
      dotenv.env['POSTER_BASEURL'].toString() + (json['poster_path'] ?? ''),
      json['genre_ids'],
      json['overview'],
      json['release_date'],
      json['title'],
      json['vote_average'],
    );
  }
}
