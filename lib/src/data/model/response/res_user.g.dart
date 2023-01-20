// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ResUserCWProxy {
  ResUser id(int? id);

  ResUser email(String? email);

  ResUser firstName(String? firstName);

  ResUser lastName(String? lastName);

  ResUser avatar(String? avatar);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ResUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ResUser(...).copyWith(id: 12, name: "My name")
  /// ````
  ResUser call({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfResUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfResUser.copyWith.fieldName(...)`
class _$ResUserCWProxyImpl implements _$ResUserCWProxy {
  const _$ResUserCWProxyImpl(this._value);

  final ResUser _value;

  @override
  ResUser id(int? id) => this(id: id);

  @override
  ResUser email(String? email) => this(email: email);

  @override
  ResUser firstName(String? firstName) => this(firstName: firstName);

  @override
  ResUser lastName(String? lastName) => this(lastName: lastName);

  @override
  ResUser avatar(String? avatar) => this(avatar: avatar);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ResUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ResUser(...).copyWith(id: 12, name: "My name")
  /// ````
  ResUser call({
    Object? id = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? firstName = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? avatar = const $CopyWithPlaceholder(),
  }) {
    return ResUser(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      firstName: firstName == const $CopyWithPlaceholder()
          ? _value.firstName
          // ignore: cast_nullable_to_non_nullable
          : firstName as String?,
      lastName: lastName == const $CopyWithPlaceholder()
          ? _value.lastName
          // ignore: cast_nullable_to_non_nullable
          : lastName as String?,
      avatar: avatar == const $CopyWithPlaceholder()
          ? _value.avatar
          // ignore: cast_nullable_to_non_nullable
          : avatar as String?,
    );
  }
}

extension $ResUserCopyWith on ResUser {
  /// Returns a callable class that can be used as follows: `instanceOfResUser.copyWith(...)` or like so:`instanceOfResUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ResUserCWProxy get copyWith => _$ResUserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResUser _$ResUserFromJson(Map<String, dynamic> json) => ResUser(
      id: json['id'] as int?,
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$ResUserToJson(ResUser instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
    };
