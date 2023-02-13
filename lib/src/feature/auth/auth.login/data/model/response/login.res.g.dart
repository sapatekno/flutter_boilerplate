// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.res.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginResCWProxy {
  LoginRes userapp(String? userapp);

  LoginRes namaapp(String? namaapp);

  LoginRes role(String? role);

  LoginRes token(String? token);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginRes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginRes(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginRes call({
    String? userapp,
    String? namaapp,
    String? role,
    String? token,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginRes.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLoginRes.copyWith.fieldName(...)`
class _$LoginResCWProxyImpl implements _$LoginResCWProxy {
  const _$LoginResCWProxyImpl(this._value);

  final LoginRes _value;

  @override
  LoginRes userapp(String? userapp) => this(userapp: userapp);

  @override
  LoginRes namaapp(String? namaapp) => this(namaapp: namaapp);

  @override
  LoginRes role(String? role) => this(role: role);

  @override
  LoginRes token(String? token) => this(token: token);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginRes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginRes(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginRes call({
    Object? userapp = const $CopyWithPlaceholder(),
    Object? namaapp = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
    Object? token = const $CopyWithPlaceholder(),
  }) {
    return LoginRes(
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

extension $LoginResCopyWith on LoginRes {
  /// Returns a callable class that can be used as follows: `instanceOfLoginRes.copyWith(...)` or like so:`instanceOfLoginRes.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginResCWProxy get copyWith => _$LoginResCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRes _$LoginResFromJson(Map<String, dynamic> json) => LoginRes(
      userapp: json['userapp'] as String?,
      namaapp: json['namaapp'] as String?,
      role: json['role'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginResToJson(LoginRes instance) => <String, dynamic>{
      'userapp': instance.userapp,
      'namaapp': instance.namaapp,
      'role': instance.role,
      'token': instance.token,
    };
