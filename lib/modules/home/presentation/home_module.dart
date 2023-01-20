import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/utils/load_json.dart';
import '../data/datasources/get_movies_datasource.dart';
import '../domain/usecases/get_movies_usecase.dart';
import '../infra/repositories/get_countries_repository.dart';
import 'home_page.dart';
import 'home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<GetMoviesDatasource>(
      (i) => GetMoviesDatasource(instance: LoadJson()),
    ),
    Bind.lazySingleton<GetMoviesRepository>(
      (i) => GetMoviesRepository(
        datasource: i.get<GetMoviesDatasource>(),
      ),
    ),
    Bind.lazySingleton<GetMoviesUsecase>(
      (i) => GetMoviesUsecase(
        repository: i.get<GetMoviesRepository>(),
      ),
    ),
    Bind.lazySingleton<HomeStore>(
      (i) => HomeStore(
        usecase: i.get<GetMoviesUsecase>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
