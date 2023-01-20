import 'package:dartz/dartz.dart';

import '../entities/movie_entity.dart';
import '../repositories/get_movies_repository.dart';

abstract class IGetMoviesUsecase {
  Future<Either<Exception, List<MovieEntity>>> call();
}

class GetMoviesUsecase extends IGetMoviesUsecase {
  final IGetMoviesRepository repository;

  GetMoviesUsecase({required this.repository});

  @override
  Future<Either<Exception, List<MovieEntity>>> call() {
    return repository();
  }
}
