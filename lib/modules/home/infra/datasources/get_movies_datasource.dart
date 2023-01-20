import 'package:dartz/dartz.dart' show Either;

import '../../domain/entities/movie_entity.dart';

abstract class IGetMoviesDatasource {
  Future<Either<Exception, List<MovieEntity>>> call();
}
