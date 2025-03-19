import 'package:flutter/material.dart';
import 'package:movie_app/data/controllers/movie_controller.dart';
import 'package:movie_app/ui/homepage/widgets/genre_catalog.dart';
import 'package:movie_app/ui/homepage/widgets/upcoming_catalog.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceInfo = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => MovieController(),
      child: Consumer<MovieController>(
        builder: (context, movieController, child) {
          return Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: deviceInfo.width * 0.02),
                child: SearchBar(
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(horizontal: deviceInfo.width * 0.05),
                  ),
                  trailing: [Icon(Icons.search)],
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  hintText: 'Pesquise seu título favorito',
                ),
              ),
              SizedBox(height: deviceInfo.height * 0.02),
              (movieController.isLoading && movieController.genres.isEmpty)
                  ? CircularProgressIndicator()
                  : (movieController.errorMessage.isNotEmpty &&
                          movieController.genres.isEmpty)
                      ? Text(movieController.errorMessage,
                          style: TextStyle(color: Colors.red))
                      : GenresCatalog(
                          movieController.genres,
                          height: deviceInfo.height * 0.15,
                        ),
              SizedBox(height: deviceInfo.height * 0.02),
              (movieController.isLoading &&
                      movieController.catalog.movies.isEmpty)
                  ? CircularProgressIndicator()
                  : (movieController.errorMessage.isNotEmpty &&
                          movieController.catalog.movies.isEmpty)
                      ? Text(movieController.errorMessage,
                          style: TextStyle(color: Colors.red))
                      : UpcomingCatalog(
                          deviceInfo.height * 0.68,
                          movieController.catalog,
                        ),
            ],
          );
        },
      ),
    );
  }
}