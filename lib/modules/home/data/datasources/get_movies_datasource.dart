import 'package:dartz/dartz.dart';

import '../../../../core/utils/load_json.dart';
import '../../domain/entities/movie_entity.dart';
import '../../infra/datasources/get_movies_datasource.dart';
import '../../infra/models/movie_model.dart';

class GetMoviesDatasource extends IGetMoviesDatasource {

  @override
  Future<Either<Exception, List<MovieEntity>>> call() async {
    final items = await LoadJson.fromAsset('assets/mock.json');
    await Future.delayed(const Duration(seconds: 1));
    return items.fold((l) => Left(l), (r) {
      try {
        return Right(
          (r['mcu'] as List)
              .map((e) => MovieModel.fromJson(e))
              .toList(),
        );
      } catch (e) {
        return Left(Exception(e));
      }
    });
  }
}
