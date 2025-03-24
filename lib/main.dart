import 'package:flutter/material.dart';
import 'package:movie_app/data/controllers/filter_controller.dart';
import 'package:movie_app/data/controllers/genre_controller.dart';
import 'package:movie_app/data/controllers/movie_controller.dart';
import 'package:movie_app/routes/app_routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<GenreController>(
          create: (context) => GenreController()),
      ChangeNotifierProvider<MovieController>(
          create: (context) => MovieController()),
      ChangeNotifierProvider<FilterController>(
        create: (context) => FilterController(),
      )
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.routesConfig,
    );
  }
}
