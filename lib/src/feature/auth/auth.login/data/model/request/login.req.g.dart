// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.req.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginReqCWProxy {
  LoginReq userapp(String userapp);

  LoginReq password(String password);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginReq(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginReq(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginReq call({
    String? userapp,
    String? password,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginReq.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLoginReq.copyWith.fieldName(...)`
class _$LoginReqCWProxyImpl implements _$LoginReqCWProxy {
  const _$LoginReqCWProxyImpl(this._value);

  final LoginReq _value;

  @override
  LoginReq userapp(String userapp) => this(userapp: userapp);

  @override
  LoginReq password(String password) => this(password: password);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginReq(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginReq(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginReq call({
    Object? userapp = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return LoginReq(
      userapp: userapp == const $CopyWithPlaceholder() || userapp == null
          // ignore: unnecessary_non_null_assertion
          ? _value.userapp!
          // ignore: cast_nullable_to_non_nullable
          : userapp as String,
      password: password == const $CopyWithPlaceholder() || password == null
          // ignore: unnecessary_non_null_assertion
          ? _value.password!
          // ignore: cast_nullable_to_non_nullable
          : password as String,
    );
  }
}

extension $LoginReqCopyWith on LoginReq {
  /// Returns a callable class that can be used as follows: `instanceOfLoginReq.copyWith(...)` or like so:`instanceOfLoginReq.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginReqCWProxy get copyWith => _$LoginReqCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginReq _$LoginReqFromJson(Map<String, dynamic> json) => LoginReq(
      userapp: json['userapp'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginReqToJson(LoginReq instance) => <String, dynamic>{
      'userapp': instance.userapp,
      'password': instance.password,
    };
