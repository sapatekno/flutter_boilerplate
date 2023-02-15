// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.res.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FileResCWProxy {
  FileRes path(String? path);

  FileRes success(bool? success);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FileRes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FileRes(...).copyWith(id: 12, name: "My name")
  /// ````
  FileRes call({
    String? path,
    bool? success,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFileRes.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFileRes.copyWith.fieldName(...)`
class _$FileResCWProxyImpl implements _$FileResCWProxy {
  const _$FileResCWProxyImpl(this._value);

  final FileRes _value;

  @override
  FileRes path(String? path) => this(path: path);

  @override
  FileRes success(bool? success) => this(success: success);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FileRes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FileRes(...).copyWith(id: 12, name: "My name")
  /// ````
  FileRes call({
    Object? path = const $CopyWithPlaceholder(),
    Object? success = const $CopyWithPlaceholder(),
  }) {
    return FileRes(
      path: path == const $CopyWithPlaceholder()
          ? _value.path
          // ignore: cast_nullable_to_non_nullable
          : path as String?,
      success: success == const $CopyWithPlaceholder()
          ? _value.success
          // ignore: cast_nullable_to_non_nullable
          : success as bool?,
    );
  }
}

extension $FileResCopyWith on FileRes {
  /// Returns a callable class that can be used as follows: `instanceOfFileRes.copyWith(...)` or like so:`instanceOfFileRes.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FileResCWProxy get copyWith => _$FileResCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileRes _$FileResFromJson(Map<String, dynamic> json) => FileRes(
      path: json['path'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$FileResToJson(FileRes instance) => <String, dynamic>{
      'path': instance.path,
      'success': instance.success,
    };
