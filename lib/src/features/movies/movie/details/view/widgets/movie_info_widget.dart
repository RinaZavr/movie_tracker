import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_tracker/src/common/extensions/context_extensions.dart';
import 'package:movie_tracker/src/features/movies/utils/utils.dart';
import 'package:movies_api/api_client.dart';

class MovieInfoWidget extends StatelessWidget {
  const MovieInfoWidget({super.key, required this.details});

  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    final descriptionTitles = [
      context.l10n.movieStatus,
      context.l10n.movieReleaseDate,
      context.l10n.movieBudget,
      context.l10n.movieRevenue,
      context.l10n.movieCompanies,
      context.l10n.movieCountries,
      context.l10n.imdb,
    ];

    final descriptionValues = [
      details.status,
      DateFormat(
        'd MMMM, y',
        context.localization.locale.languageCode,
      ).format(DateTime.parse(details.releaseDate)),
      formatCurrency(details.budget),
      formatCurrency(details.revenue),
      details.productionCompanies.join(', '),
      details.productionCountries.join(', '),
      details.imdbId,
    ];

    return Table(
      children: [
        for (int i = 0; i < descriptionTitles.length; i++)
          TableRow(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: context.colorExt.lineColor),
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  descriptionTitles[i],
                  style: context.textExt.base.copyWith(
                    color: context.colorExt.hintColor,
                  ),
                ),
              ),
              if (i == descriptionValues.length - 1)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      context.l10n.goTo,
                      style: context.textExt.base.copyWith(
                        color: context.colorExt.infoColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    descriptionValues[i] ?? '',
                    style: context.textExt.base,
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
