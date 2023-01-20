// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PageableCWProxy<T> {
  Pageable<T> page(int? page);

  Pageable<T> perPage(int? perPage);

  Pageable<T> total(int? total);

  Pageable<T> totalPages(int? totalPages);

  Pageable<T> data(List<T>? data);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Pageable<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Pageable<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  Pageable<T> call({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<T>? data,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPageable.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPageable.copyWith.fieldName(...)`
class _$PageableCWProxyImpl<T> implements _$PageableCWProxy<T> {
  const _$PageableCWProxyImpl(this._value);

  final Pageable<T> _value;

  @override
  Pageable<T> page(int? page) => this(page: page);

  @override
  Pageable<T> perPage(int? perPage) => this(perPage: perPage);

  @override
  Pageable<T> total(int? total) => this(total: total);

  @override
  Pageable<T> totalPages(int? totalPages) => this(totalPages: totalPages);

  @override
  Pageable<T> data(List<T>? data) => this(data: data);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Pageable<T>(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Pageable<T>(...).copyWith(id: 12, name: "My name")
  /// ````
  Pageable<T> call({
    Object? page = const $CopyWithPlaceholder(),
    Object? perPage = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
    Object? totalPages = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
  }) {
    return Pageable<T>(
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

extension $PageableCopyWith<T> on Pageable<T> {
  /// Returns a callable class that can be used as follows: `instanceOfPageable.copyWith(...)` or like so:`instanceOfPageable.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PageableCWProxy<T> get copyWith => _$PageableCWProxyImpl<T>(this);
}
