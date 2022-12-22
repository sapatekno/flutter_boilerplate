import 'package:dartz/dartz.dart';

import '../../entity/app/failure.dart';
import '../../entity/pageable.dart';
import '../../entity/user.dart';
import '../../model/response/res_pageable.dart';
import '../../model/response/res_user.dart';
import '../../source/api/reqres.api.dart';
import '../user.repository.dart';

class UserRepositoryImpl extends UserRepository {
  final ReqresApi reqresApi;

  UserRepositoryImpl(this.reqresApi);

  @override
  Future<Either<Failure, Pageable<User>>> getUsers({required int page}) async {
    var source = await reqresApi.getUsers(page: page);
    return source.fold(
      (failure) => left(failure),
      (source) {
        try {
          if (source.data == null) return Left(Failure.fromNoResponseFromApi(source));
          var response = ResPageable<ResUser>.fromJson(source.data, (json) => ResUser.fromJson(json as dynamic));
          if (response.data == null) return Left(Failure.fromNoResponseFromApi(source));
          var result = Pageable<User>.fromResPageable(response, (dataT) => User.fromResUser(dataT as ResUser));
          return Right(result);
        } catch (error, stackTrace) {
          return Left(Failure(error: error, stackTrace: stackTrace));
        }
      },
    );
  }
}
