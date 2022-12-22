import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'res_user.g.dart';

@CopyWith()
@JsonSerializable()
class ResUser extends Equatable {
  final int? id;
  final String? email;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? avatar;

  const ResUser({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory ResUser.fromJson(Map<String, dynamic> json) => _$ResUserFromJson(json);

  Map<String, dynamic> toJson() => _$ResUserToJson(this);

  @override
  List<Object?> get props => [id, email];
}
