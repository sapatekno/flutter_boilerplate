// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.req.e.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CustomerReqECWProxy {
  CustomerReqE akurasi(double? akurasi);

  CustomerReqE idPel(String? idPel);

  CustomerReqE latitude(double? latitude);

  CustomerReqE longitude(double? longitude);

  CustomerReqE petugas(String? petugas);

  CustomerReqE surveyZoneTime(String? surveyZoneTime);

  CustomerReqE tanggalSurvey(String? tanggalSurvey);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CustomerReqE(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CustomerReqE(...).copyWith(id: 12, name: "My name")
  /// ````
  CustomerReqE call({
    double? akurasi,
    String? idPel,
    double? latitude,
    double? longitude,
    String? petugas,
    String? surveyZoneTime,
    String? tanggalSurvey,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCustomerReqE.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCustomerReqE.copyWith.fieldName(...)`
class _$CustomerReqECWProxyImpl implements _$CustomerReqECWProxy {
  const _$CustomerReqECWProxyImpl(this._value);

  final CustomerReqE _value;

  @override
  CustomerReqE akurasi(double? akurasi) => this(akurasi: akurasi);

  @override
  CustomerReqE idPel(String? idPel) => this(idPel: idPel);

  @override
  CustomerReqE latitude(double? latitude) => this(latitude: latitude);

  @override
  CustomerReqE longitude(double? longitude) => this(longitude: longitude);

  @override
  CustomerReqE petugas(String? petugas) => this(petugas: petugas);

  @override
  CustomerReqE surveyZoneTime(String? surveyZoneTime) => this(surveyZoneTime: surveyZoneTime);

  @override
  CustomerReqE tanggalSurvey(String? tanggalSurvey) => this(tanggalSurvey: tanggalSurvey);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CustomerReqE(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CustomerReqE(...).copyWith(id: 12, name: "My name")
  /// ````
  CustomerReqE call({
    Object? akurasi = const $CopyWithPlaceholder(),
    Object? idPel = const $CopyWithPlaceholder(),
    Object? latitude = const $CopyWithPlaceholder(),
    Object? longitude = const $CopyWithPlaceholder(),
    Object? petugas = const $CopyWithPlaceholder(),
    Object? surveyZoneTime = const $CopyWithPlaceholder(),
    Object? tanggalSurvey = const $CopyWithPlaceholder(),
  }) {
    return CustomerReqE(
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

extension $CustomerReqECopyWith on CustomerReqE {
  /// Returns a callable class that can be used as follows: `instanceOfCustomerReqE.copyWith(...)` or like so:`instanceOfCustomerReqE.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CustomerReqECWProxy get copyWith => _$CustomerReqECWProxyImpl(this);
}
