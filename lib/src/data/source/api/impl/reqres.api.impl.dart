import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/src/util/http.util.dart';

import '../../../entity/app/failure.dart';
import '../reqres.api.dart';

class ReqresApiImpl extends ReqresApi {
  final HttpUtil http;

  ReqresApiImpl(this.http);

  String pathUser = 'users';

  Dio get client {
    Dio dio = http.getClient();
    dio.options.baseUrl = 'https://reqres.in/api/';
    return dio;
  }

  @override
  Future<Either<Failure, Response>> getUsers({required int page}) async {
    try {
      return Right(await client.get(pathUser, queryParameters: {'page': page}));
    } catch (error, stackTrace) {
      return Left(Failure(error: error, stackTrace: stackTrace));
    }
  }
}
