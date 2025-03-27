import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/domain/models/catalog.dart';
import 'package:movie_app/domain/models/genre.dart';
import 'package:movie_app/domain/models/movie.dart';

class GenreService {
  Future<List<Genre>> getGenres() async {
    try {
      http.Response response = await http.get(
          Uri.parse('https://api.themoviedb.org/3/genre/movie/list'),
          headers: {
            "accept": "application/json",
            "Authorization": "Bearer ${dotenv.env['API_KEY']}"
          });
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw HttpException('Http error getGenres: ${response.statusCode}');
      }
      return (json['genres'] as List)
          .map((genre) => Genre.fromJson(genre))
          .toList();
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }

  Future<Catalog> getGenreMovies(int genreId) async {
    try {
      http.Response response = await http.get(
          Uri.parse(
              'https://api.themoviedb.org/3/discover/movie?&language=pt-BR&include_adult=false&include_video=false&with_genres=$genreId'),
          headers: {
            "accept": "application/json",
            "Authorization": "Bearer ${dotenv.env['API_KEY']}"
          });
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw HttpException('Http error getGenres: ${response.statusCode}');
      }
      return Catalog(
          json['page'],
          (json['results'] as List)
              .map((movie) => Movie.fromJson(movie))
              .toList());
    } catch (e) {
      throw Exception('Erro getUpcomingMovies: $e');
    }
  }
}
