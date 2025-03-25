import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/domain/models/genre.dart';
import 'package:movie_app/domain/models/movie.dart';
import 'package:movie_app/ui/genre_movies/genre_movies.dart';
import 'package:movie_app/ui/homepage/homepage.dart';
import 'package:movie_app/ui/movie_detail/movie_detail.dart';

class AppRoutes {
  AppRoutes(BuildContext context);

  static GoRouter get routesConfig => _routesConfig;

  static final GoRouter _routesConfig = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: 'homepage',
        builder: (BuildContext context, GoRouterState state) {
          return const Homepage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'details',
            name: '/movie_detail',
            builder: (BuildContext context, GoRouterState state) {
              Movie movie = state.extra as Movie;
              return MovieDetail(
                movie: movie,
              );
            },
          ),
          GoRoute(
            path: 'genre_movies',
            name: '/genre_movies',
            builder: (BuildContext context, GoRouterState state) {
              Genre genre = state.extra as Genre;
              return GenreMovies(
                genre: genre,
              );
            },
          ),
        ],
      ),
    ],
  );
}
