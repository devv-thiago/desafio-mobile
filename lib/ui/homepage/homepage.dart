import 'package:flutter/material.dart';
import 'package:movie_app/data/controllers/genre_controller.dart';
import 'package:movie_app/ui/core/fonts.dart';
import 'package:movie_app/utils/search_delegate.dart';
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
      resizeToAvoidBottomInset: false,
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
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: deviceInfo.width * 0.05),
                  height: deviceInfo.height * 0.06,
                  decoration: BoxDecoration(
                    color: AppColors.color1,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => showSearch(
                            context: context,
                            delegate: Search(
                              searchFieldLabel: "Digite o que deseja",
                            ),
                          ),
                          child: Text(
                            'Pesquise seu título favorito',
                            style: AppFontStyle.darkMedium,
                          ),
                        ),
                      ),
                      Icon(Icons.search, color: AppColors.background),
                    ],
                  ),
                )),
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
