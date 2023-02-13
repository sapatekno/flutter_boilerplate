// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FailureCWProxy {
  Failure isProcessed(bool isProcessed);

  Failure message(String? message);

  Failure detail(String? detail);

  Failure error(dynamic error);

  Failure stackTrace(StackTrace? stackTrace);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Failure(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Failure(...).copyWith(id: 12, name: "My name")
  /// ````
  Failure call({
    bool? isProcessed,
    String? message,
    String? detail,
    dynamic? error,
    StackTrace? stackTrace,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFailure.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFailure.copyWith.fieldName(...)`
class _$FailureCWProxyImpl implements _$FailureCWProxy {
  const _$FailureCWProxyImpl(this._value);

  final Failure _value;

  @override
  Failure isProcessed(bool isProcessed) => this(isProcessed: isProcessed);

  @override
  Failure message(String? message) => this(message: message);

  @override
  Failure detail(String? detail) => this(detail: detail);

  @override
  Failure error(dynamic error) => this(error: error);

  @override
  Failure stackTrace(StackTrace? stackTrace) => this(stackTrace: stackTrace);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Failure(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Failure(...).copyWith(id: 12, name: "My name")
  /// ````
  Failure call({
    Object? isProcessed = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? detail = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? stackTrace = const $CopyWithPlaceholder(),
  }) {
    return Failure(
      isProcessed:
          isProcessed == const $CopyWithPlaceholder() || isProcessed == null
              // ignore: unnecessary_non_null_assertion
              ? _value.isProcessed!
              // ignore: cast_nullable_to_non_nullable
              : isProcessed as bool,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      detail: detail == const $CopyWithPlaceholder()
          ? _value.detail
          // ignore: cast_nullable_to_non_nullable
          : detail as String?,
      error: error == const $CopyWithPlaceholder() || error == null
          // ignore: unnecessary_non_null_assertion
          ? _value.error!
          // ignore: cast_nullable_to_non_nullable
          : error as dynamic,
      stackTrace: stackTrace == const $CopyWithPlaceholder()
          ? _value.stackTrace
          // ignore: cast_nullable_to_non_nullable
          : stackTrace as StackTrace?,
    );
  }
}

extension $FailureCopyWith on Failure {
  /// Returns a callable class that can be used as follows: `instanceOfFailure.copyWith(...)` or like so:`instanceOfFailure.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FailureCWProxy get copyWith => _$FailureCWProxyImpl(this);
}
