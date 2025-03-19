import 'package:flutter/material.dart';
import 'package:movie_app/data/services/genre_service.dart';
import 'package:movie_app/domain/models/genre.dart';

class GenreController extends ChangeNotifier{
  final GenreService _genreService = GenreService();
  List<Genre> _genres = [];
  bool _isLoading = true;
  String _errorMessage = '';

  List<Genre> get genres => _genres;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

    GenreController() {
    fetchGenres();
  }

  Future<void> fetchGenres() async {
    _isLoading = true;
    notifyListeners();

    try {
      _genres = await _genreService.getGenres();
    } catch (e) {
      _errorMessage = 'Erro interno do aplicativo, contate a equipe de suporte!';
    }

    _isLoading = false;
    notifyListeners();
  }
}