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
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZmMyNjNmN2U2YTc3ZjE0ZTJlZTRjOWY4NDE0ZmViNSIsIm5iZiI6MTc0MTI4MDAwNC4zNDgsInN1YiI6IjY3YzlkMzA0ZTIyMDRmYzljMDBjZWRmYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UGiL81wy1hczpvt7YwvGD_Ll_VJ6ci59vos0xeGA8kA"
          });
      debugPrint(response.body);
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }
}
