import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/domain/models/genre.dart';

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
      return (json['genres'] as List)
          .map((genre) => Genre.fromJson(genre))
          .toList();
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }
}