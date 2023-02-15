import 'package:dartz/dartz.dart';

import '../../../app/data/entity/failure.dart';
import '../../substation.survey/data/entity/response/substation.res.e.dart';

abstract class SubStationRepo {
  Future<Either<Failure, SubStationResE>> getGarduById(String id);
}
