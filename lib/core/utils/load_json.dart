import 'dart:convert' show jsonDecode;

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart' show rootBundle;

class LoadJson {
  static Future<Either<Exception, Map<String, dynamic>>> fromAsset(
    String path,
  ) async {
    try {
      final data = await rootBundle.loadString(path);
      var result = jsonDecode(data);
      return Right(result);
    } catch (e) {
      return Left(Exception('LoadJson.fromAsset($path): $e'));
    }
  }
}
