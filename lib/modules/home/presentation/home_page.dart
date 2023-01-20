import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../shared/widgets/app_bar.dart';
import '../../../shared/widgets/empties/list_empty.dart';
import '../../../shared/widgets/loading.dart';
import '../../../shared/widgets/request_error.dart';
import '../domain/entities/movie_entity.dart';
import 'home_store.dart';
import 'widgets/movie_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();

  @override
  void initState() {
    super.initState();
    store.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: Text(
          'Filmes',
          style: Theme.of(context).textTheme.headline4?.copyWith(
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
        ),
      ),
      body: SafeArea(
        child: ScopedBuilder<HomeStore, Exception, List<MovieEntity>>(
          store: store,
          onState: (_, state) {
            if (state.isEmpty) {
              return Center(
                child: ListEmpty(
                  padding: const EdgeInsets.all(16),
                  message: 'Nenhum filme encontrato.',
                  onPressed: () => store.getMovies(),
                ),
              );
            }
            return MovieList(store: store);
          },
          onLoading: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [Center(child: Loading())],
            );
          },
          onError: (context, error) => Center(
            child: RequestError(
              padding: const EdgeInsets.all(16),
              message: error.toString(),
              onPressed: () => store.getMovies(),
            ),
          ),
        ),
      ),
    );
  }
}
