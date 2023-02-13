import 'package:dartz/dartz.dart';

import '../../../app/data/entity/failure.dart';
import '../../auth.login/data/entity/request/login.req.e.dart';
import '../../auth.login/data/entity/response/login.res.e.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResE>> postAuthLogin(LoginReqE data);
}
