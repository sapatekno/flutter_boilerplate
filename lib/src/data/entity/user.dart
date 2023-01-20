import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/src/data/model/response/res_user.dart';

part 'user.g.dart';

@CopyWith()
class User extends Equatable {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  @override
  List<Object?> get props => [id, email];

  static User fromResUser(ResUser data) => User(
        id: data.id,
        email: data.email,
        firstName: data.firstName,
        lastName: data.lastName,
        avatar: data.avatar,
      );

  static ResUser toResUser(User data) => ResUser(
        id: data.id,
        email: data.email,
        firstName: data.firstName,
        lastName: data.lastName,
        avatar: data.avatar,
      );
}
