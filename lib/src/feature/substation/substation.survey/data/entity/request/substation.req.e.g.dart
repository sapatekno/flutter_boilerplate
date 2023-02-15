// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'substation.req.e.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SubstationReqECWProxy {
  SubstationReqE akurasi(double? akurasi);

  SubstationReqE detailGardu(List<SubStationDetailReqE>? detailGardu);

  SubstationReqE jumlahTrafo(int? jumlahTrafo);

  SubstationReqE latitude(double? latitude);

  SubstationReqE longitude(double? longitude);

  SubstationReqE nomorGardu(String? nomorGardu);

  SubstationReqE petugas(String? petugas);

  SubstationReqE photo(String? photo);

  SubstationReqE surveyZoneTime(String? surveyZoneTime);

  SubstationReqE tanggalSurvey(String? tanggalSurvey);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SubstationReqE(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SubstationReqE(...).copyWith(id: 12, name: "My name")
  /// ````
  SubstationReqE call({
    double? akurasi,
    List<SubStationDetailReqE>? detailGardu,
    int? jumlahTrafo,
    double? latitude,
    double? longitude,
    String? nomorGardu,
    String? petugas,
    String? photo,
    String? surveyZoneTime,
    String? tanggalSurvey,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSubstationReqE.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSubstationReqE.copyWith.fieldName(...)`
class _$SubstationReqECWProxyImpl implements _$SubstationReqECWProxy {
  const _$SubstationReqECWProxyImpl(this._value);

  final SubstationReqE _value;

  @override
  SubstationReqE akurasi(double? akurasi) => this(akurasi: akurasi);

  @override
  SubstationReqE detailGardu(List<SubStationDetailReqE>? detailGardu) => this(detailGardu: detailGardu);

  @override
  SubstationReqE jumlahTrafo(int? jumlahTrafo) => this(jumlahTrafo: jumlahTrafo);

  @override
  SubstationReqE latitude(double? latitude) => this(latitude: latitude);

  @override
  SubstationReqE longitude(double? longitude) => this(longitude: longitude);

  @override
  SubstationReqE nomorGardu(String? nomorGardu) => this(nomorGardu: nomorGardu);

  @override
  SubstationReqE petugas(String? petugas) => this(petugas: petugas);

  @override
  SubstationReqE photo(String? photo) => this(photo: photo);

  @override
  SubstationReqE surveyZoneTime(String? surveyZoneTime) => this(surveyZoneTime: surveyZoneTime);

  @override
  SubstationReqE tanggalSurvey(String? tanggalSurvey) => this(tanggalSurvey: tanggalSurvey);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SubstationReqE(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SubstationReqE(...).copyWith(id: 12, name: "My name")
  /// ````
  SubstationReqE call({
    Object? akurasi = const $CopyWithPlaceholder(),
    Object? detailGardu = const $CopyWithPlaceholder(),
    Object? jumlahTrafo = const $CopyWithPlaceholder(),
    Object? latitude = const $CopyWithPlaceholder(),
    Object? longitude = const $CopyWithPlaceholder(),
    Object? nomorGardu = const $CopyWithPlaceholder(),
    Object? petugas = const $CopyWithPlaceholder(),
    Object? photo = const $CopyWithPlaceholder(),
    Object? surveyZoneTime = const $CopyWithPlaceholder(),
    Object? tanggalSurvey = const $CopyWithPlaceholder(),
  }) {
    return SubstationReqE(
      akurasi: akurasi == const $CopyWithPlaceholder()
          ? _value.akurasi
          // ignore: cast_nullable_to_non_nullable
          : akurasi as double?,
      detailGardu: detailGardu == const $CopyWithPlaceholder()
          ? _value.detailGardu
          // ignore: cast_nullable_to_non_nullable
          : detailGardu as List<SubStationDetailReqE>?,
      jumlahTrafo: jumlahTrafo == const $CopyWithPlaceholder()
          ? _value.jumlahTrafo
          // ignore: cast_nullable_to_non_nullable
          : jumlahTrafo as int?,
      latitude: latitude == const $CopyWithPlaceholder()
          ? _value.latitude
          // ignore: cast_nullable_to_non_nullable
          : latitude as double?,
      longitude: longitude == const $CopyWithPlaceholder()
          ? _value.longitude
          // ignore: cast_nullable_to_non_nullable
          : longitude as double?,
      nomorGardu: nomorGardu == const $CopyWithPlaceholder()
          ? _value.nomorGardu
          // ignore: cast_nullable_to_non_nullable
          : nomorGardu as String?,
      petugas: petugas == const $CopyWithPlaceholder()
          ? _value.petugas
          // ignore: cast_nullable_to_non_nullable
          : petugas as String?,
      photo: photo == const $CopyWithPlaceholder()
          ? _value.photo
          // ignore: cast_nullable_to_non_nullable
          : photo as String?,
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

extension $SubstationReqECopyWith on SubstationReqE {
  /// Returns a callable class that can be used as follows: `instanceOfSubstationReqE.copyWith(...)` or like so:`instanceOfSubstationReqE.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SubstationReqECWProxy get copyWith => _$SubstationReqECWProxyImpl(this);
}
