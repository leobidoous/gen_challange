import 'package:dartz/dartz.dart';

import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/get_movies_repository.dart';
import '../datasources/get_movies_datasource.dart';

class GetMoviesRepository extends IGetMoviesRepository {
  final IGetMoviesDatasource datasource;

  GetMoviesRepository({required this.datasource});

  @override
  Future<Either<Exception, List<MovieEntity>>> call() {
    return datasource();
  }
}
