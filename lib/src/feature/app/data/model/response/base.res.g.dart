// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.res.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BaseResCWProxy<T> {
  BaseRes<T> code(int? code);

  BaseRes<T> message(String? message);

  BaseRes<T> success(bool? success);

  BaseRes<T> data(T? data);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseRes<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseRes<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseRes<T> call({
    int? code,
    String? message,
    bool? success,
    T? data,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBaseRes.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBaseRes.copyWith.fieldName(...)`
class _$BaseResCWProxyImpl<T> implements _$BaseResCWProxy<T> {
  const _$BaseResCWProxyImpl(this._value);

  final BaseRes<T> _value;

  @override
  BaseRes<T> code(int? code) => this(code: code);

  @override
  BaseRes<T> message(String? message) => this(message: message);

  @override
  BaseRes<T> success(bool? success) => this(success: success);

  @override
  BaseRes<T> data(T? data) => this(data: data);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseRes<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseRes<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseRes<T> call({
    Object? code = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? success = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
  }) {
    return BaseRes<T>(
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as int?,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      success: success == const $CopyWithPlaceholder()
          ? _value.success
          // ignore: cast_nullable_to_non_nullable
          : success as bool?,
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as T?,
    );
  }
}

extension $BaseResCopyWith<T> on BaseRes<T> {
  /// Returns a callable class that can be used as follows: `instanceOfBaseRes.copyWith(...)` or like so:`instanceOfBaseRes.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BaseResCWProxy<T> get copyWith => _$BaseResCWProxyImpl<T>(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseRes<T> _$BaseResFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseRes<T>(
      code: json['code'] as int?,
      message: json['message'] as String?,
      success: json['success'] as bool?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$BaseResToJson<T>(
  BaseRes<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'success': instance.success,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
