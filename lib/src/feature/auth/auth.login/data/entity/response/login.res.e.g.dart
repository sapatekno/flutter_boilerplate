// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.res.e.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginResECWProxy {
  LoginResE userapp(String? userapp);

  LoginResE namaapp(String? namaapp);

  LoginResE role(String? role);

  LoginResE token(String? token);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginResE(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginResE(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginResE call({
    String? userapp,
    String? namaapp,
    String? role,
    String? token,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginResE.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLoginResE.copyWith.fieldName(...)`
class _$LoginResECWProxyImpl implements _$LoginResECWProxy {
  const _$LoginResECWProxyImpl(this._value);

  final LoginResE _value;

  @override
  LoginResE userapp(String? userapp) => this(userapp: userapp);

  @override
  LoginResE namaapp(String? namaapp) => this(namaapp: namaapp);

  @override
  LoginResE role(String? role) => this(role: role);

  @override
  LoginResE token(String? token) => this(token: token);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginResE(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginResE(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginResE call({
    Object? userapp = const $CopyWithPlaceholder(),
    Object? namaapp = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
    Object? token = const $CopyWithPlaceholder(),
  }) {
    return LoginResE(
      userapp: userapp == const $CopyWithPlaceholder()
          ? _value.userapp
          // ignore: cast_nullable_to_non_nullable
          : userapp as String?,
      namaapp: namaapp == const $CopyWithPlaceholder()
          ? _value.namaapp
          // ignore: cast_nullable_to_non_nullable
          : namaapp as String?,
      role: role == const $CopyWithPlaceholder()
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as String?,
      token: token == const $CopyWithPlaceholder()
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String?,
    );
  }
}

extension $LoginResECopyWith on LoginResE {
  /// Returns a callable class that can be used as follows: `instanceOfLoginResE.copyWith(...)` or like so:`instanceOfLoginResE.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginResECWProxy get copyWith => _$LoginResECWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResE _$LoginResEFromJson(Map<String, dynamic> json) => LoginResE(
      userapp: json['userapp'] as String?,
      namaapp: json['namaapp'] as String?,
      role: json['role'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginResEToJson(LoginResE instance) => <String, dynamic>{
      'userapp': instance.userapp,
      'namaapp': instance.namaapp,
      'role': instance.role,
      'token': instance.token,
    };
