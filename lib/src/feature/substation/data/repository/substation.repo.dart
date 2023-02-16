import 'package:dartz/dartz.dart';

import '../../../app/data/entity/failure.dart';
import '../../substation.survey/data/entity/response/substation.res.e.dart';
import '../../substation.survey/data/model/request/substation.req.dart';

abstract class SubStationRepo {
  Future<Either<Failure, SubStationResE>> getGarduById(String id);

  Future<Either<Failure, String>> postGarduTagging(SubstationReq data);
}
