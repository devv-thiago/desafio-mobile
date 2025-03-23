import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/e_filter.dart';
import 'package:movie_app/ui/core/colors.dart';
import 'package:movie_app/ui/core/fonts.dart';

class MovieFilterSelector extends StatefulWidget {
  const MovieFilterSelector({super.key});


  @override
  _MovieFilterSelectorState createState() => _MovieFilterSelectorState();
}

class _MovieFilterSelectorState extends State<MovieFilterSelector> {
  Set<MovieFilter> selectedFilter = {MovieFilter.upcoming};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<MovieFilter>(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.color2; // Cor de fundo ao selecionar
          }
           // Cor de fundo padrão
        }),
        side: WidgetStateProperty.all(BorderSide(color: AppColors.color1)),
      ),
      segments: [
        ButtonSegment(
          label: Text(
            'Upcoming',
            style: AppFontStyle.lightMedium,
          ),
          value: MovieFilter.upcoming,
        ),
        ButtonSegment(
          label: Text(
            'Popular',
            style: AppFontStyle.lightMedium,
          ),
          value: MovieFilter.popular,
        ),
      ],
      selected: selectedFilter,
      onSelectionChanged: (newSelection) {
        setState(() {
          selectedFilter = newSelection;
        });
      },
    );
  }
}
