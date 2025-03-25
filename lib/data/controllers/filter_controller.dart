import 'package:flutter/material.dart';
import 'package:movie_app/domain/enum/enum_filter.dart';

class FilterController extends ChangeNotifier {
  Set<EnumMovieFilter> _movieFilter = {EnumMovieFilter.upcoming};

  Set<EnumMovieFilter> get movieFilter => _movieFilter;

  void changeFilter(Set<EnumMovieFilter> newFilter) {
    _movieFilter = newFilter;
    notifyListeners();
  }
}
