import 'package:dartz/dartz.dart';

import '../../../../app/data/entity/failure.dart';
import '../../../../app/data/model/response/base.res.dart';
import '../../../../app/data/source/network/api/survey_ami.api.dart';
import '../../../auth.login/data/entity/request/login.req.e.dart';
import '../../../auth.login/data/entity/response/login.res.e.dart';
import '../../../auth.login/data/model/response/login.res.dart';
import '../auth.repo.dart';

class AuthRepoImpl implements AuthRepo {
  final SurveyAmiApi surveyAmiApi;

  AuthRepoImpl(this.surveyAmiApi);

  @override
  Future<Either<Failure, LoginResE>> postAuthLogin(LoginReqE data) async {
    var source = await surveyAmiApi.postAuthLogin(data.toLoginReq());
    return source.fold(
      (failure) => left(failure),
      (source) {
        try {
          if (source.data == null) return Left(Failure.fromNoResponseFromApi(source));
          var response = BaseRes<LoginRes>.fromJson(source.data, (json) => LoginRes.fromJson(json as dynamic));
          if (response.data == null) return Left(Failure.fromNoResponseFromApi(source));
          var result = LoginResE.fromLoginRes(response.data!);
          return Right(result);
        } catch (error, stackTrace) {
          return Left(Failure(error: error, stackTrace: stackTrace));
        }
      },
    );
  }
}
