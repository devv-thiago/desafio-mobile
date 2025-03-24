import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/e_filter.dart';

class FilterController extends ChangeNotifier {
  Set<MovieFilter> _movieFilter = {MovieFilter.upcoming};

  Set<MovieFilter> get movieFilter => _movieFilter;

  void changeFilter(Set<MovieFilter> newFilter) {
    _movieFilter = newFilter;
    notifyListeners();
  }
}
