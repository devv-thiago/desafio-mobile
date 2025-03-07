import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieService {
  void example() async {
    try {
      http.Response response = await http.get(
          Uri.parse(
              'https://api.themoviedb.org/3/genre/movie/list?language=en'),
          headers: {
            "accept": "application/json",
            "Authorization": ""
          });
      debugPrint(response.body);
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }
}
