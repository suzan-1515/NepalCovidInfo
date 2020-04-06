import 'package:flutter/material.dart';

import 'package:covid19_info/core/models/country.dart';

import 'package:covid19_info/ui/styles/styles.dart';
import 'package:covid19_info/ui/widgets/common/label.dart';
import 'package:covid19_info/ui/widgets/global_page/country_stat_chart.dart';

class CountryCard extends StatelessWidget {
  final Country country;

  const CountryCard({
    @required this.country,
  }) : assert(country != null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Open country detail
      },
      child: Container(
        height: 128.0,
        margin: const EdgeInsets.only(top: 8.0, left: 16.0, bottom: 8.0),
        padding: const EdgeInsets.only(top: 12.0, right: 12.0, bottom: 12.0),
        decoration: BoxDecoration(
          color: AppColors.dark,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(64.0),
            bottomLeft: Radius.circular(64.0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 12.0),
            _buildGraph(),
            _buildStats(),
          ],
        ),
      ),
    );
  }

  Flexible _buildStats() {
    return Flexible(
      flex: 2,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Text(
              country.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.mediumLight,
            ),
          ),
          const Divider(height: 12.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: _buildStatColumn(),
          ),
        ],
      ),
    );
  }

  Column _buildStatColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildCount('Active', Colors.yellow, country.activeCases),
        const SizedBox(height: 8.0),
        _buildCount('Recovered', Colors.green, country.totalRecovered),
        const SizedBox(height: 8.0),
        _buildCount('Deaths', Colors.red, country.totalDeaths),
      ],
    );
  }

  Widget _buildCount(String label, Color color, int count) {
    return Row(
      children: <Widget>[
        Label(text: label, color: color),
        const Spacer(),
        Text(
          count.toString(),
          style: AppTextStyles.smallLight.copyWith(color: color),
        ),
      ],
    );
  }

  Widget _buildGraph() {
    return Flexible(
      flex: 1,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CountryStatChart(
            active: country.activeCases,
            recovered: country.totalRecovered,
            deaths: country.totalDeaths,
          ),
          Container(
            height: 44.0,
            width: 44.0,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  'https://www.countryflags.io/${country.code}/flat/48.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
