import 'package:movie_app/domain/models/movie.dart';

class Catalog {
  int page;
  List<Movie> movies;

  Catalog(this.page, this.movies);

  factory Catalog.fromJson(Map<String, dynamic> json) => Catalog(
        json['page'],
        json['results'],
      );
}
