import 'package:flutter/material.dart';
import 'package:movie_app/data/controllers/filter_controller.dart';
import 'package:movie_app/data/controllers/movie_controller.dart';
import 'package:movie_app/domain/models/e_filter.dart';
import 'package:movie_app/ui/core/colors.dart';
import 'package:movie_app/ui/homepage/widgets/movie_catalog.dart';
import 'package:provider/provider.dart';

class Movies extends StatelessWidget {
  
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceInfo = MediaQuery.of(context).size;
    return (context.watch<FilterController>().movieFilter.contains(MovieFilter.upcoming)) ? Consumer<MovieController>(
                builder: (context, movieController, child) {
              return (movieController.isLoading &&
                      movieController.upcomingCatalog.movies.isEmpty)
                  ? CircularProgressIndicator(color: AppColors.color2)
                  : (movieController.errorMessage.isNotEmpty &&
                          movieController.upcomingCatalog.movies.isEmpty)
                      ? Text(movieController.errorMessage,
                          style: TextStyle(color: Colors.red))
                      : MovieCatalog(
                          deviceInfo: deviceInfo,
                          catalog: movieController.upcomingCatalog,
                        );
            }) :  Consumer<MovieController>(
                builder: (context, movieController, child) {
              return (movieController.isLoading &&
                      movieController.popularCatalog.movies.isEmpty)
                  ? CircularProgressIndicator(color: AppColors.color2)
                  : (movieController.errorMessage.isNotEmpty &&
                          movieController.popularCatalog.movies.isEmpty)
                      ? Text(movieController.errorMessage,
                          style: TextStyle(color: Colors.red))
                      : MovieCatalog(
                          deviceInfo: deviceInfo,
                          catalog: movieController.popularCatalog,
                        );
            })    ;
  }
}