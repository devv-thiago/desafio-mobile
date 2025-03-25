import 'package:flutter/material.dart';
import 'package:movie_app/data/controllers/genre_controller.dart';
import 'package:movie_app/ui/core/colors.dart';
import 'package:movie_app/ui/homepage/widgets/genre_list.dart';
import 'package:movie_app/ui/homepage/widgets/filter_selection.dart';
import 'package:movie_app/ui/homepage/widgets/movies.dart';

import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceInfo = MediaQuery.of(context).size;

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
            Consumer<GenreController>(
                builder: (context, genreController, child) {
              return (genreController.isLoading &&
                      genreController.genres.isEmpty)
                  ? CircularProgressIndicator(color: AppColors.color2)
                  : (genreController.errorMessage.isNotEmpty &&
                          genreController.genres.isEmpty)
                      ? Text(genreController.errorMessage,
                          style: TextStyle(color: Colors.red))
                      : GenresList(
                          viewTitle: true,
                          deviceInfo: deviceInfo,
                          genres: genreController.genres,
                        );
            }),
            MovieFilterSelector(),
            Movies(),
          ],
        ),
      ),
    );
  }
}
