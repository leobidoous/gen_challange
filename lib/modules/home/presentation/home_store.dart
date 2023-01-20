import 'package:flutter_triple/flutter_triple.dart';

import '../domain/entities/movie_entity.dart';
import '../domain/usecases/get_movies_usecase.dart';

class HomeStore extends NotifierStore<Exception, List<MovieEntity>> {
  final IGetMoviesUsecase usecase;

  HomeStore({required this.usecase}) : super([]);

  Future<void> getMovies() async {
    setLoading(true);
    await usecase().then((value) {
      value.fold((l) => setError(l), (r) => update(r));
    }).whenComplete(() => setLoading(false));
  }
}
