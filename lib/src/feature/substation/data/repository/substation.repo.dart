import 'package:dartz/dartz.dart';

import '../../../app/data/entity/failure.dart';
import '../../substation.survey/data/model/response/substation.res.dart';

abstract class SubStationRepo {
  Future<Either<Failure, SubStationRes>> getGarduById(String id);
}
