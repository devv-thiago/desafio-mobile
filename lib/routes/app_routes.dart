import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/ui/homepage/homepage.dart';
import 'package:movie_app/ui/movie_detail/movie_detail.dart';

class AppRoutes {
  AppRoutes(BuildContext context);

  static GoRouter get routesConfig => _routesConfig;

  static final GoRouter _routesConfig = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Homepage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'details',
            builder: (BuildContext context, GoRouterState state) {
              return const MovieDetail();
            },
          ),
        ],
      ),
    ],
  );
}
