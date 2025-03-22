import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/domain/models/cast.dart';
import 'package:movie_app/domain/models/catalog.dart';
import 'package:movie_app/domain/models/movie.dart';
import 'package:movie_app/domain/models/person.dart';

class MovieService {
  Future<Catalog> getUpcomingMovies() async {
    try {
      http.Response response = await http.get(
          Uri.parse(
              'https://api.themoviedb.org/3/movie/upcoming?language=pt-BR'),
          headers: {
            "accept": "application/json",
            "Authorization": "Bearer ${dotenv.env['API_KEY']}"
          });
      final Map<String, dynamic> json = jsonDecode(response.body);
      return Catalog(
          json['page'],
          (json['results'] as List)
              .map((movie) => Movie.fromJson(movie))
              .toList());
    } catch (e) {
      throw Exception('Erro getUpcomingMovies: $e');
    }
  }

  Future<Cast> getCast(int movieId) async {
    try {
      http.Response response = await http.get(
          Uri.parse('https://api.themoviedb.org/3/movie/$movieId/credits'),
          headers: {
            "accept": "application/json",
            "Authorization": "Bearer ${dotenv.env['API_KEY']}"
          });
      final Map<String, dynamic> json = jsonDecode(response.body);

      return Cast(
          movieCast: (json['cast'] as List)
              .map((person) => Person.fromJson(person))
              .toList());
    } catch (e) {
      throw Exception('Erro getCast: $e');
    }
  }
}
