import 'package:flutter/material.dart';

import '../../../../shared/widgets/refresh_indicator.dart';
import '../home_store.dart';
import 'movie_item.dart';

class CountryList extends StatelessWidget {
  final HomeStore store;
  final ScrollController scrollController = ScrollController();
  CountryList({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: DefaultRefreshIndicator(
        onRefresh: () async {
          store.getMovies();
        },
        child: ListView.separated(
          controller: scrollController,
          itemCount: store.state.length,
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (_, index) {
            return CountryItem(country: store.state[index]);
          },
        ),
      ),
    );
  }
}
