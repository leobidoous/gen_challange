import 'package:dartz/dartz.dart';

import '../entities/movie_entity.dart';

abstract class IGetMoviesRepository {
  Future<Either<Exception, List<MovieEntity>>> call();
}
