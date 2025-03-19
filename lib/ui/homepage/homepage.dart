import 'package:flutter/material.dart';
import 'package:movie_app/data/controllers/movie_controller.dart';
import 'package:movie_app/ui/core/colors.dart';
import 'package:movie_app/ui/homepage/widgets/genre_list.dart';
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
          return Scaffold(
            body: Container(
              padding: EdgeInsets.only(
            top: deviceInfo.width * 0.1,
                    ),
                    color: AppColors.background,
                    height: deviceInfo.height,
                    width: deviceInfo.width,
              child: Column(
                spacing: deviceInfo.height * 0.02,
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
                  (movieController.isLoading && movieController.genres.isEmpty)
                      ? CircularProgressIndicator()
                      : (movieController.errorMessage.isNotEmpty &&
                              movieController.genres.isEmpty)
                          ? Text(movieController.errorMessage,
                              style: TextStyle(color: Colors.red))
                          : GenresList(
                              deviceInfo: deviceInfo,
                              genres: movieController.genres,
                            ),
                  (movieController.isLoading &&
                          movieController.catalog.movies.isEmpty)
                      ? CircularProgressIndicator()
                      : (movieController.errorMessage.isNotEmpty &&
                              movieController.catalog.movies.isEmpty)
                          ? Text(movieController.errorMessage,
                              style: TextStyle(color: Colors.red))
                          : UpcomingCatalog(
                              deviceInfo: deviceInfo,
                              catalog: movieController.catalog,
                            ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
