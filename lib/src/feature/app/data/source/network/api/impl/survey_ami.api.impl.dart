import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../../config/config.dart';
import '../../../../../../auth/auth.login/data/model/request/login.req.dart';
import '../../../../entity/failure.dart';
import '../../client/http.client.dart';
import '../survey_ami.api.dart';

class SurveyAmiApiImpl implements SurveyAmiApi {
  final HttpClient http;
  final Config config;

  SurveyAmiApiImpl(this.http, this.config);

  String pathAuthLogin = 'auth/login';

  @override
  Dio get client {
    Dio client = http.client;
    client.options.baseUrl = config.surveyAmiApiUrl;
    return client;
  }

  @override
  Future<Either<Failure, Response>> call(Future<Response> response) async {
    try {
      return Right(await response);
    } catch (error, stackTrace) {
      return Left(Failure(error: error, stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, Response>> postAuthLogin(LoginReq data) => call(
        client.post(pathAuthLogin, data: data.toJson()),
      );

  @override
  Future<Either<Failure, Response>> getGarduById() {
    // TODO: implement getGarduById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Response>> getPelangganById() {
    // TODO: implement getPelangganById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Response>> postGarduTagging() {
    // TODO: implement postGarduTagging
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Response>> postPelangganTagging() {
    // TODO: implement postPelangganTagging
    throw UnimplementedError();
  }
}
