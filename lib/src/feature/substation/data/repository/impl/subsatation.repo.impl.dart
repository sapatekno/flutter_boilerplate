import 'package:dartz/dartz.dart';
import 'package:surveyami/src/feature/app/data/entity/failure.dart';
import 'package:surveyami/src/feature/app/data/source/network/api/survey_ami.api.dart';
import 'package:surveyami/src/feature/substation/substation.survey/data/model/request/substation.req.dart';
import 'package:surveyami/src/feature/substation/substation.survey/data/model/response/substation.res.dart';

import '../../../../app/data/model/response/base.res.dart';
import '../../../substation.survey/data/entity/response/substation.res.e.dart';
import '../substation.repo.dart';

class SubStationRepoImpl implements SubStationRepo {
  final SurveyAmiApi surveyAmiApi;

  SubStationRepoImpl(this.surveyAmiApi);

  @override
  Future<Either<Failure, SubStationResE>> getGarduById(String id) async {
    var source = await surveyAmiApi.getGarduById(id);
    return source.fold(
      (failure) => left(failure),
      (source) {
        try {
          var response = BaseRes<SubStationRes>.fromJson(source.data, (json) => SubStationRes.fromJson(json as dynamic));

          if (response.success == false) return Left(Failure.failSuccessIsFalse(response.message));

          var result = SubStationResE.fromSubStationRes(response.data!);
          return Right(result);
        } catch (error, stackTrace) {
          return Left(Failure(error: error, stackTrace: stackTrace));
        }
      },
    );
  }

  @override
  Future<Either<Failure, bool>> postGarduTagging(SubstationReq data) async {
    var source = await surveyAmiApi.postGarduTagging(data);
    return source.fold(
      (failure) => left(failure),
      (source) {
        try {
          // var response = BaseRes<SubStationRes>.fromJson(source.data, (json) => SubStationRes.fromJson(json as dynamic));
          //
          // if (response.success == false) return Left(Failure.failSuccessIsFalse(response.message));
          //
          // var result = SubStationResE.fromSubStationRes(response.data!);
          // return Right(result);
          return Right(true);
        } catch (error, stackTrace) {
          return Left(Failure(error: error, stackTrace: stackTrace));
        }
      },
    );
  }
}
