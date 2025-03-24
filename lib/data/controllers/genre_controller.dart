import 'package:flutter/material.dart';
import 'package:movie_app/data/services/genre_service.dart';
import 'package:movie_app/domain/models/catalog.dart';
import 'package:movie_app/domain/models/genre.dart';
import 'package:translator/translator.dart';

class GenreController extends ChangeNotifier {
  final translator = GoogleTranslator();
  final GenreService _genreService = GenreService();
  List<Genre> _genres = [];
  Catalog _catalog = Catalog(1, []);
  bool _isLoading = true;
  String _errorMessage = '';

  List<Genre> get genres => _genres;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  Catalog get catalog => _catalog;

  GenreController() {
    fetchGenres();
  }

  Future<void> fetchGenres() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<Genre> englishGenres = await _genreService.getGenres();

      List<Genre> translatedGenres = await Future.wait(
        englishGenres.map((genre) async {
          final translatedName =
              await translator.translate(genre.name, from: 'en', to: 'pt');
          return Genre(genre.id, translatedName.text);
        }),
      );

      _genres = translatedGenres;
    } catch (e) {
      _errorMessage =
          'Erro interno do aplicativo, contate a equipe de suporte!';
      throw Exception('Erro fetchGenres: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchGenreMovies(int genreId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _catalog = await _genreService.getGenreMovies(genreId);
    } catch (e) {
      _errorMessage =
          'Erro interno do aplicativo, contate a equipe de suporte!';
      throw Exception('Erro fetchGenreMovies: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
