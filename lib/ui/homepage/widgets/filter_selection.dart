import 'package:flutter/material.dart';
import 'package:movie_app/data/controllers/filter_controller.dart';
import 'package:movie_app/domain/models/e_filter.dart';
import 'package:movie_app/ui/core/colors.dart';
import 'package:movie_app/ui/core/fonts.dart';
import 'package:provider/provider.dart';

class MovieFilterSelector extends StatelessWidget {
  const MovieFilterSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<MovieFilter>(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.color2;
          }
          return AppColors.background;
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
      selected: context.watch<FilterController>().movieFilter,
      onSelectionChanged: (newSelection) {
        context.read<FilterController>().changeFilter(newSelection);
      },
    );
  }
}
