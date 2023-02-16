import 'package:dartz/dartz.dart';

import '../../../../app/data/entity/failure.dart';
import '../../../../app/data/model/response/base.res.dart';
import '../../../../app/data/source/network/api/survey_ami.api.dart';
import '../../entity/response/customer.res.e.dart';
import '../../model/request/customer.req.dart';
import '../../model/response/customer.res.dart';
import '../customer.repo.dart';

class CustomerRepoImpl implements CustomerRepo {
  final SurveyAmiApi surveyAmiApi;

  CustomerRepoImpl(this.surveyAmiApi);

  @override
  Future<Either<Failure, CustomerResE>> getCustomerById(String id) async {
    var source = await surveyAmiApi.getPelangganById(id);
    return source.fold(
      (failure) => left(failure),
      (source) {
        try {
          var response = BaseRes<CustomerRes>.fromJson(source.data, (json) => CustomerRes.fromJson(json as dynamic));

          if (response.success == false) return Left(Failure.failSuccessIsFalse(response.message));

          var result = CustomerResE.fromCustomerRes(response.data!);
          return Right(result);
        } catch (error, stackTrace) {
          return Left(Failure(error: error, stackTrace: stackTrace));
        }
      },
    );
  }

  @override
  Future<Either<Failure, String>> postCustomerTagging(CustomerReq data) async {
    var source = await surveyAmiApi.postPelangganTagging(data);
    return source.fold(
      (failure) => left(failure),
      (source) {
        try {
          var response = BaseRes<String?>.fromJson(source.data, (json) => json as String?);
          if (response.success == false) return Left(Failure.failSuccessIsFalse(response.message));

          return Right(response.data ?? "Data Berhasil Disimpan");
        } catch (error, stackTrace) {
          return Left(Failure(error: error, stackTrace: stackTrace));
        }
      },
    );
  }
}
