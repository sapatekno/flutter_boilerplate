import 'package:dartz/dartz.dart';

import '../../../app/data/entity/failure.dart';
import '../entity/response/customer.res.e.dart';
import '../model/request/customer.req.dart';

abstract class CustomerRepo {
  Future<Either<Failure, CustomerResE>> getCustomerById(String id);

  Future<Either<Failure, String>> postCustomerTagging(CustomerReq data);
}
