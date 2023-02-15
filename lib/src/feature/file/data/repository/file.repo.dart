import 'package:dartz/dartz.dart';

import '../../../app/data/entity/failure.dart';

abstract class FileRepo {
  Future<Either<Failure, String?>> postMinioUpload(String id, String filePath);
}
