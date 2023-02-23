import 'package:dartz/dartz.dart';

import '../../../../app/data/entity/failure.dart';
import '../../../../app/data/model/response/base.res.dart';
import '../../../../app/data/source/network/api/survey_ami.api.dart';
import '../../model/response/file.res.dart';
import '../file.repo.dart';

class FileRepoImpl implements FileRepo {
  final SurveyAmiApi surveyAmiApi;

  FileRepoImpl(this.surveyAmiApi);

  @override
  Future<Either<Failure, String?>> postMinioUpload(String id, String filePath, String photo) async {
    var source = await surveyAmiApi.postMinioUpload(id, filePath, photo);
    return source.fold(
      (failure) => left(failure),
      (source) {
        try {
          var response = BaseRes<FileRes>.fromJson(source.data, (json) => FileRes.fromJson(json as dynamic));
          var result = response.data?.path;
          return Right(result);
        } catch (error, stackTrace) {
          return Left(Failure(error: error, stackTrace: stackTrace));
        }
      },
    );
  }
}
