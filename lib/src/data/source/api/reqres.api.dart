import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../entity/app/failure.dart';
import 'api.dart';

abstract class ReqresApi extends Api {
  Future<Either<Failure, Response>> getUsers({required int page});
}
