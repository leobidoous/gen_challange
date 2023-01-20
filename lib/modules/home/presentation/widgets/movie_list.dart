import 'package:flutter/material.dart';

import '../../../../shared/widgets/refresh_indicator.dart';
import '../home_store.dart';
import 'movie_item.dart';

class MovieList extends StatelessWidget {
  final HomeStore store;
  final ScrollController scrollController = ScrollController();
  MovieList({super.key, required this.store});

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
            return MovieItem(movie: store.state[index]);
          },
        ),
      ),
    );
  }
}
