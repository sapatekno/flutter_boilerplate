import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login.res.g.dart';

@CopyWith()
@JsonSerializable()
class LoginRes extends Equatable {
  final String? userapp;
  final String? namaapp;
  final String? role;
  final String? token;

  const LoginRes({
    required this.userapp,
    required this.namaapp,
    required this.role,
    required this.token,
  });

  factory LoginRes.fromJson(Map<String, dynamic> json) => _$LoginResFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResToJson(this);

  @override
  List<Object?> get props => [userapp, role];
}
