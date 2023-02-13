// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.req.e.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginReqECWProxy {
  LoginReqE userapp(String userapp);

  LoginReqE password(String password);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginReqE(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginReqE(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginReqE call({
    String? userapp,
    String? password,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginReqE.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLoginReqE.copyWith.fieldName(...)`
class _$LoginReqECWProxyImpl implements _$LoginReqECWProxy {
  const _$LoginReqECWProxyImpl(this._value);

  final LoginReqE _value;

  @override
  LoginReqE userapp(String userapp) => this(userapp: userapp);

  @override
  LoginReqE password(String password) => this(password: password);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginReqE(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginReqE(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginReqE call({
    Object? userapp = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return LoginReqE(
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

extension $LoginReqECopyWith on LoginReqE {
  /// Returns a callable class that can be used as follows: `instanceOfLoginReqE.copyWith(...)` or like so:`instanceOfLoginReqE.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginReqECWProxy get copyWith => _$LoginReqECWProxyImpl(this);
}
