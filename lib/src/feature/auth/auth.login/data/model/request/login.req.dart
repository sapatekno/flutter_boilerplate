import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login.req.g.dart';

@CopyWith()
@JsonSerializable()
class LoginReq extends Equatable {
  final String userapp;
  final String password;

  const LoginReq({required this.userapp, required this.password});

  factory LoginReq.fromJson(Map<String, dynamic> json) => _$LoginReqFromJson(json);

  Map<String, dynamic> toJson() => _$LoginReqToJson(this);

  @override
  List<Object?> get props => [userapp];
}
