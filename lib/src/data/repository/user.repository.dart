import 'package:dartz/dartz.dart';

import '../entity/app/failure.dart';
import '../entity/pageable.dart';
import '../entity/user.dart';
import 'repository.dart';

abstract class UserRepository extends Repository {
  Future<Either<Failure, Pageable<User>>> getUsers({required int page});
}
