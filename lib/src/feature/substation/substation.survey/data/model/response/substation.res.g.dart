// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'substation.res.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SubStationResCWProxy {
  SubStationRes nomorGardu(String? nomorGardu);

  SubStationRes typeGardu(String? typeGardu);

  SubStationRes latitude(double? latitude);

  SubStationRes longitude(double? longitude);

  SubStationRes description(String? description);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SubStationRes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SubStationRes(...).copyWith(id: 12, name: "My name")
  /// ````
  SubStationRes call({
    String? nomorGardu,
    String? typeGardu,
    double? latitude,
    double? longitude,
    String? description,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSubStationRes.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSubStationRes.copyWith.fieldName(...)`
class _$SubStationResCWProxyImpl implements _$SubStationResCWProxy {
  const _$SubStationResCWProxyImpl(this._value);

  final SubStationRes _value;

  @override
  SubStationRes nomorGardu(String? nomorGardu) => this(nomorGardu: nomorGardu);

  @override
  SubStationRes typeGardu(String? typeGardu) => this(typeGardu: typeGardu);

  @override
  SubStationRes latitude(double? latitude) => this(latitude: latitude);

  @override
  SubStationRes longitude(double? longitude) => this(longitude: longitude);

  @override
  SubStationRes description(String? description) => this(description: description);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SubStationRes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SubStationRes(...).copyWith(id: 12, name: "My name")
  /// ````
  SubStationRes call({
    Object? nomorGardu = const $CopyWithPlaceholder(),
    Object? typeGardu = const $CopyWithPlaceholder(),
    Object? latitude = const $CopyWithPlaceholder(),
    Object? longitude = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
  }) {
    return SubStationRes(
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

extension $SubStationResCopyWith on SubStationRes {
  /// Returns a callable class that can be used as follows: `instanceOfSubStationRes.copyWith(...)` or like so:`instanceOfSubStationRes.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SubStationResCWProxy get copyWith => _$SubStationResCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubStationRes _$SubStationResFromJson(Map<String, dynamic> json) => SubStationRes(
      nomorGardu: json['nomorGardu'] as String?,
      typeGardu: json['typeGardu'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SubStationResToJson(SubStationRes instance) => <String, dynamic>{
      'nomorGardu': instance.nomorGardu,
      'typeGardu': instance.typeGardu,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'description': instance.description,
    };
