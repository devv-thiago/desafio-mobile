import 'package:flutter/material.dart';
import 'package:movie_app/data/services/movie_service.dart';
import 'package:movie_app/domain/models/catalog.dart';
import 'package:movie_app/domain/models/genre.dart';

class MovieController extends ChangeNotifier {
  final MovieService _movieService = MovieService();
  List<Genre> _genres = [];
  Catalog _catalog = Catalog(1, []);
  bool _isLoading = true;
  String _errorMessage = '';

  List<Genre> get genres => _genres;
  Catalog get catalog => _catalog;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  MovieController() {
    fetchGenres();
    fetchUpcoming();
  }

  Future<void> fetchGenres() async {
    _isLoading = true;
    notifyListeners();

    try {
      _genres = await _movieService.getGenres();
    } catch (e) {
      _errorMessage = 'Erro ao carregar gêneros';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchUpcoming() async {
    _isLoading = true;
    notifyListeners();

    try {
      _catalog = await _movieService.getUpcomingMovies();
    } catch (e) {
      _errorMessage = 'Erro ao carregar filmes';
    }

    _isLoading = false;
    notifyListeners();
  }
}
