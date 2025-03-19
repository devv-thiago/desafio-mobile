import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/domain/models/catalog.dart';
import 'package:movie_app/domain/models/genre.dart';
import 'package:movie_app/domain/models/movie.dart';

class MovieService {
  Future<List<Genre>> getGenres() async {
    try {
      http.Response response = await http.get(
          Uri.parse('https://api.themoviedb.org/3/genre/movie/list'),
          headers: {
            "accept": "application/json",
            "Authorization": "Bearer ${dotenv.env['API_KEY']}"
          });
      final Map<String, dynamic> json = jsonDecode(response.body);
      return (json['genres'] as List)
          .map((genre) => Genre.fromJson(genre))
          .toList();
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }

  Future<Catalog> getUpcomingMovies() async {
    Catalog? catalog;
    try {
      http.Response response = await http.get(
          Uri.parse(
              'https://api.themoviedb.org/3/movie/upcoming?language=pt-BR'),
          headers: {
            "accept": "application/json",
            "Authorization": "Bearer ${dotenv.env['API_KEY']}"
          });
      final Map<String, dynamic> json = jsonDecode(response.body);
      catalog = Catalog(
          json['page'],
          (json['results'] as List)
              .map((movie) => Movie.fromJson(movie))
              .toList());
      return catalog;
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }
}
