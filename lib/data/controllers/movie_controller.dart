import 'package:flutter/material.dart';
import 'package:movie_app/data/services/movie_service.dart';
import 'package:movie_app/domain/models/catalog.dart';

class MovieController extends ChangeNotifier {
  final MovieService _movieService = MovieService();
  Catalog _catalog = Catalog(1, []);
  bool _isLoading = true;
  String _errorMessage = '';

  Catalog get catalog => _catalog;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  MovieController() {
    fetchUpcoming();
  }

  Future<void> fetchUpcoming() async {
    _isLoading = true;
    notifyListeners();

    try {
      _catalog = await _movieService.getUpcomingMovies();
    } catch (e) {
      _errorMessage =
          'Erro interno do aplicativo, contate a equipe de suporte!';
    }

    _isLoading = false;
    notifyListeners();
  }
}
