import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../auth/auth.login/data/model/request/login.req.dart';
import '../../../entity/failure.dart';
import 'api.dart';

abstract class SurveyAmiApi extends Api {
  Future<Either<Failure, Response>> postAuthLogin(LoginReq data);

  Future<Either<Failure, Response>> getGarduById();

  Future<Either<Failure, Response>> postGarduTagging();

  Future<Either<Failure, Response>> getPelangganById();

  Future<Either<Failure, Response>> postPelangganTagging();
}
