import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../model/request/login.req.dart';

part 'login.req.e.g.dart';

@CopyWith()
class LoginReqE extends Equatable {
  final String userapp;
  final String password;

  const LoginReqE({required this.userapp, required this.password});

  factory LoginReqE.fromLoginReq(LoginReq data) => LoginReqE(userapp: data.userapp, password: data.password);

  LoginReq toLoginReq() => LoginReq(userapp: userapp, password: password);

  @override
  List<Object?> get props => [userapp];
}
