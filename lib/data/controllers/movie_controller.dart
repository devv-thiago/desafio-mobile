import 'package:flutter/material.dart';
import 'package:movie_app/data/services/movie_service.dart';
import 'package:movie_app/domain/models/cast.dart';
import 'package:movie_app/domain/models/catalog.dart';

class MovieController extends ChangeNotifier {
  final MovieService _movieService = MovieService();
  Catalog _upcomingCatalog = Catalog(1, []);
  Catalog _popularCatalog = Catalog(1, []);
  Cast _cast = Cast(movieCast: []);
  bool _isLoading = true;
  String _errorMessage = '';

  Catalog get upcomingCatalog => _upcomingCatalog;
  Catalog get popularCatalog => _popularCatalog;
  Cast get cast => _cast;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  MovieController() {
    fetchUpcoming();
    fetchPopular();
  }

  Future<void> fetchUpcoming() async {
    _isLoading = true;
    notifyListeners();

    try {
      _upcomingCatalog = await _movieService.getUpcomingMovies();
    } catch (e) {
      _errorMessage =
          'Erro interno do aplicativo, contate a equipe de suporte!';
      throw Exception('Erro fetchUpcoming: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchPopular() async {
    _isLoading = true;
    notifyListeners();

    try {
      _popularCatalog = await _movieService.getPopularMovies();
    } catch (e) {
      _errorMessage =
          'Erro interno do aplicativo, contate a equipe de suporte!';
      throw Exception('Erro fetchPopular: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchMovieCast(int movieId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _cast = await _movieService.getCast(movieId);
    } catch (e) {
      _errorMessage =
          'Erro interno do aplicativo, contate a equipe de suporte!';
      throw Exception('Erro fetchMovieCast: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
