// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_pageable.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ResPageableCWProxy<T> {
  ResPageable<T> page(int? page);

  ResPageable<T> perPage(int? perPage);

  ResPageable<T> total(int? total);

  ResPageable<T> totalPages(int? totalPages);

  ResPageable<T> data(List<T>? data);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ResPageable<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ResPageable<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  ResPageable<T> call({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<T>? data,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfResPageable.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfResPageable.copyWith.fieldName(...)`
class _$ResPageableCWProxyImpl<T> implements _$ResPageableCWProxy<T> {
  const _$ResPageableCWProxyImpl(this._value);

  final ResPageable<T> _value;

  @override
  ResPageable<T> page(int? page) => this(page: page);

  @override
  ResPageable<T> perPage(int? perPage) => this(perPage: perPage);

  @override
  ResPageable<T> total(int? total) => this(total: total);

  @override
  ResPageable<T> totalPages(int? totalPages) => this(totalPages: totalPages);

  @override
  ResPageable<T> data(List<T>? data) => this(data: data);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ResPageable<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ResPageable<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  ResPageable<T> call({
    Object? page = const $CopyWithPlaceholder(),
    Object? perPage = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
    Object? totalPages = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
  }) {
    return ResPageable<T>(
      page: page == const $CopyWithPlaceholder()
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as int?,
      perPage: perPage == const $CopyWithPlaceholder()
          ? _value.perPage
          // ignore: cast_nullable_to_non_nullable
          : perPage as int?,
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int?,
      totalPages: totalPages == const $CopyWithPlaceholder()
          ? _value.totalPages
          // ignore: cast_nullable_to_non_nullable
          : totalPages as int?,
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<T>?,
    );
  }
}

extension $ResPageableCopyWith<T> on ResPageable<T> {
  /// Returns a callable class that can be used as follows: `instanceOfResPageable.copyWith(...)` or like so:`instanceOfResPageable.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ResPageableCWProxy<T> get copyWith => _$ResPageableCWProxyImpl<T>(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResPageable<T> _$ResPageableFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ResPageable<T>(
      page: json['page'] as int?,
      perPage: json['per_page'] as int?,
      total: json['total'] as int?,
      totalPages: json['total_pages'] as int?,
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$ResPageableToJson<T>(
  ResPageable<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data?.map(toJsonT).toList(),
    };
