import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../model/response/login.res.dart';

part 'login.res.e.g.dart';

@CopyWith()
@JsonSerializable()
class LoginResE extends Equatable {
  final String? userapp;
  final String? namaapp;
  final String? role;
  final String? token;

  const LoginResE({
    required this.userapp,
    required this.namaapp,
    required this.role,
    required this.token,
  });

  factory LoginResE.fromLoginRes(LoginRes data) => LoginResE(
        userapp: data.userapp,
        namaapp: data.namaapp,
        role: data.role,
        token: data.token,
      );

  LoginRes toLoginResE() => LoginRes(
        userapp: userapp,
        namaapp: namaapp,
        role: role,
        token: token,
      );

  factory LoginResE.fromJson(Map<String, dynamic> json) => _$LoginResEFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResEToJson(this);

  @override
  List<Object?> get props => [userapp, role];
}
