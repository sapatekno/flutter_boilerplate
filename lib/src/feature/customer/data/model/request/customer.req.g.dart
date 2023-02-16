// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.req.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CustomerReqCWProxy {
  CustomerReq akurasi(double? akurasi);

  CustomerReq idPel(String? idPel);

  CustomerReq latitude(double? latitude);

  CustomerReq longitude(double? longitude);

  CustomerReq petugas(String? petugas);

  CustomerReq surveyZoneTime(String? surveyZoneTime);

  CustomerReq tanggalSurvey(String? tanggalSurvey);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CustomerReq(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CustomerReq(...).copyWith(id: 12, name: "My name")
  /// ````
  CustomerReq call({
    double? akurasi,
    String? idPel,
    double? latitude,
    double? longitude,
    String? petugas,
    String? surveyZoneTime,
    String? tanggalSurvey,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCustomerReq.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCustomerReq.copyWith.fieldName(...)`
class _$CustomerReqCWProxyImpl implements _$CustomerReqCWProxy {
  const _$CustomerReqCWProxyImpl(this._value);

  final CustomerReq _value;

  @override
  CustomerReq akurasi(double? akurasi) => this(akurasi: akurasi);

  @override
  CustomerReq idPel(String? idPel) => this(idPel: idPel);

  @override
  CustomerReq latitude(double? latitude) => this(latitude: latitude);

  @override
  CustomerReq longitude(double? longitude) => this(longitude: longitude);

  @override
  CustomerReq petugas(String? petugas) => this(petugas: petugas);

  @override
  CustomerReq surveyZoneTime(String? surveyZoneTime) => this(surveyZoneTime: surveyZoneTime);

  @override
  CustomerReq tanggalSurvey(String? tanggalSurvey) => this(tanggalSurvey: tanggalSurvey);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CustomerReq(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CustomerReq(...).copyWith(id: 12, name: "My name")
  /// ````
  CustomerReq call({
    Object? akurasi = const $CopyWithPlaceholder(),
    Object? idPel = const $CopyWithPlaceholder(),
    Object? latitude = const $CopyWithPlaceholder(),
    Object? longitude = const $CopyWithPlaceholder(),
    Object? petugas = const $CopyWithPlaceholder(),
    Object? surveyZoneTime = const $CopyWithPlaceholder(),
    Object? tanggalSurvey = const $CopyWithPlaceholder(),
  }) {
    return CustomerReq(
      akurasi: akurasi == const $CopyWithPlaceholder()
          ? _value.akurasi
          // ignore: cast_nullable_to_non_nullable
          : akurasi as double?,
      idPel: idPel == const $CopyWithPlaceholder()
          ? _value.idPel
          // ignore: cast_nullable_to_non_nullable
          : idPel as String?,
      latitude: latitude == const $CopyWithPlaceholder()
          ? _value.latitude
          // ignore: cast_nullable_to_non_nullable
          : latitude as double?,
      longitude: longitude == const $CopyWithPlaceholder()
          ? _value.longitude
          // ignore: cast_nullable_to_non_nullable
          : longitude as double?,
      petugas: petugas == const $CopyWithPlaceholder()
          ? _value.petugas
          // ignore: cast_nullable_to_non_nullable
          : petugas as String?,
      surveyZoneTime: surveyZoneTime == const $CopyWithPlaceholder()
          ? _value.surveyZoneTime
          // ignore: cast_nullable_to_non_nullable
          : surveyZoneTime as String?,
      tanggalSurvey: tanggalSurvey == const $CopyWithPlaceholder()
          ? _value.tanggalSurvey
          // ignore: cast_nullable_to_non_nullable
          : tanggalSurvey as String?,
    );
  }
}

extension $CustomerReqCopyWith on CustomerReq {
  /// Returns a callable class that can be used as follows: `instanceOfCustomerReq.copyWith(...)` or like so:`instanceOfCustomerReq.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CustomerReqCWProxy get copyWith => _$CustomerReqCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerReq _$CustomerReqFromJson(Map<String, dynamic> json) => CustomerReq(
      akurasi: (json['akurasi'] as num?)?.toDouble(),
      idPel: json['idPel'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      petugas: json['petugas'] as String?,
      surveyZoneTime: json['surveyZoneTime'] as String?,
      tanggalSurvey: json['tanggalSurvey'] as String?,
    );

Map<String, dynamic> _$CustomerReqToJson(CustomerReq instance) => <String, dynamic>{
      'akurasi': instance.akurasi,
      'idPel': instance.idPel,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'petugas': instance.petugas,
      'surveyZoneTime': instance.surveyZoneTime,
      'tanggalSurvey': instance.tanggalSurvey,
    };
