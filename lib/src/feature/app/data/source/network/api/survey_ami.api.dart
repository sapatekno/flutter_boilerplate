import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../auth/auth.login/data/model/request/login.req.dart';
import '../../../../../customer/data/model/request/customer.req.dart';
import '../../../../../substation/substation.survey/data/model/request/substation.req.dart';
import '../../../entity/failure.dart';
import 'api.dart';

abstract class SurveyAmiApi extends Api {
  Future<Either<Failure, Response>> postAuthLogin(LoginReq data);

  Future<Either<Failure, Response>> getGarduById(String id);

  Future<Either<Failure, Response>> postGarduTagging(SubstationReq data);

  Future<Either<Failure, Response>> getPelangganById(String id);

  Future<Either<Failure, Response>> postPelangganTagging(CustomerReq data);

  Future<Either<Failure, Response>> postMinioUpload(String id, String filePath, String photo);
}
