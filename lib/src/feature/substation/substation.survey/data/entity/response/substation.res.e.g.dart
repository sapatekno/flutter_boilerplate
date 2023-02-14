// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'substation.res.e.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SubStationResECWProxy {
  SubStationResE nomorGardu(String? nomorGardu);

  SubStationResE typeGardu(String? typeGardu);

  SubStationResE latitude(double? latitude);

  SubStationResE longitude(double? longitude);

  SubStationResE description(String? description);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SubStationResE(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SubStationResE(...).copyWith(id: 12, name: "My name")
  /// ````
  SubStationResE call({
    String? nomorGardu,
    String? typeGardu,
    double? latitude,
    double? longitude,
    String? description,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSubStationResE.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSubStationResE.copyWith.fieldName(...)`
class _$SubStationResECWProxyImpl implements _$SubStationResECWProxy {
  const _$SubStationResECWProxyImpl(this._value);

  final SubStationResE _value;

  @override
  SubStationResE nomorGardu(String? nomorGardu) => this(nomorGardu: nomorGardu);

  @override
  SubStationResE typeGardu(String? typeGardu) => this(typeGardu: typeGardu);

  @override
  SubStationResE latitude(double? latitude) => this(latitude: latitude);

  @override
  SubStationResE longitude(double? longitude) => this(longitude: longitude);

  @override
  SubStationResE description(String? description) => this(description: description);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SubStationResE(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SubStationResE(...).copyWith(id: 12, name: "My name")
  /// ````
  SubStationResE call({
    Object? nomorGardu = const $CopyWithPlaceholder(),
    Object? typeGardu = const $CopyWithPlaceholder(),
    Object? latitude = const $CopyWithPlaceholder(),
    Object? longitude = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
  }) {
    return SubStationResE(
      nomorGardu: nomorGardu == const $CopyWithPlaceholder()
          ? _value.nomorGardu
          // ignore: cast_nullable_to_non_nullable
          : nomorGardu as String?,
      typeGardu: typeGardu == const $CopyWithPlaceholder()
          ? _value.typeGardu
          // ignore: cast_nullable_to_non_nullable
          : typeGardu as String?,
      latitude: latitude == const $CopyWithPlaceholder()
          ? _value.latitude
          // ignore: cast_nullable_to_non_nullable
          : latitude as double?,
      longitude: longitude == const $CopyWithPlaceholder()
          ? _value.longitude
          // ignore: cast_nullable_to_non_nullable
          : longitude as double?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
    );
  }
}

extension $SubStationResECopyWith on SubStationResE {
  /// Returns a callable class that can be used as follows: `instanceOfSubStationResE.copyWith(...)` or like so:`instanceOfSubStationResE.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SubStationResECWProxy get copyWith => _$SubStationResECWProxyImpl(this);
}
