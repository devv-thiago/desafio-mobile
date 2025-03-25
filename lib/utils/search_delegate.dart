import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/data/controllers/movie_controller.dart';
import 'package:movie_app/ui/core/colors.dart';
import 'package:movie_app/ui/core/fonts.dart';
import 'package:provider/provider.dart';

class Search extends SearchDelegate {
  Search({
    required super.searchFieldLabel,
  });

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
        textTheme: TextTheme(
            labelSmall: AppFontStyle.lightSmall,
            labelMedium: AppFontStyle.lightMedium,
            labelLarge: AppFontStyle.lightMedium),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.background2,
          iconTheme: IconThemeData(color: AppColors.color1),
          titleTextStyle: AppFontStyle.lightMedium,
          toolbarTextStyle: AppFontStyle.lightMedium,
        ),
        inputDecorationTheme: searchFieldDecorationTheme ??
            InputDecorationTheme(
              hintStyle: AppFontStyle.lightMedium,
              border: InputBorder.none,
            ));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final movieController = Provider.of<MovieController>(context);
    final results = [
      ...movieController.popularCatalog.movies,
      ...movieController.upcomingCatalog.movies
    ]
        .where(
            (movie) => movie.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Container(
        decoration: BoxDecoration(
          color: AppColors.background,
        ),
        child: results.isEmpty
            ? Center(
                child: Text(
                "No results found",
                style: AppFontStyle.lightMedium,
              ))
            : ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(results[index].title,
                        style: AppFontStyle.lightMedium),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.color1,
                    ),
                    onTap: () {
                      context.goNamed('/movie_detail', extra: results[index]);
                    },
                  );
                },
              ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final movieController = Provider.of<MovieController>(context);
    final suggestions = movieController.upcomingCatalog.movies;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
      ),
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title:
                Text(suggestions[index].title, style: AppFontStyle.lightMedium),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.color1,
            ),
            onTap: () {
              context.goNamed('/movie_detail', extra: suggestions[index]);
            },
          );
        },
      ),
    );
  }
}
