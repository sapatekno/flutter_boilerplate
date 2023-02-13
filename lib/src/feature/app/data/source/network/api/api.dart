import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../entity/failure.dart';

abstract class Api {
  Dio get client;

  Future<Either<Failure, Response>> call(Future<Response> response);
}
