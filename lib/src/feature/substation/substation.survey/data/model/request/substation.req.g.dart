// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'substation.req.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SubstationReqCWProxy {
  SubstationReq akurasi(double? akurasi);

  SubstationReq detailGardu(List<SubStationDetailReq>? detailGardu);

  SubstationReq jumlahTrafo(int? jumlahTrafo);

  SubstationReq latitude(double? latitude);

  SubstationReq longitude(double? longitude);

  SubstationReq nomorGardu(String? nomorGardu);

  SubstationReq petugas(String? petugas);

  SubstationReq photo(String? photo);

  SubstationReq surveyZoneTime(String? surveyZoneTime);

  SubstationReq tanggalSurvey(String? tanggalSurvey);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SubstationReq(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SubstationReq(...).copyWith(id: 12, name: "My name")
  /// ````
  SubstationReq call({
    double? akurasi,
    List<SubStationDetailReq>? detailGardu,
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

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSubstationReq.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSubstationReq.copyWith.fieldName(...)`
class _$SubstationReqCWProxyImpl implements _$SubstationReqCWProxy {
  const _$SubstationReqCWProxyImpl(this._value);

  final SubstationReq _value;

  @override
  SubstationReq akurasi(double? akurasi) => this(akurasi: akurasi);

  @override
  SubstationReq detailGardu(List<SubStationDetailReq>? detailGardu) => this(detailGardu: detailGardu);

  @override
  SubstationReq jumlahTrafo(int? jumlahTrafo) => this(jumlahTrafo: jumlahTrafo);

  @override
  SubstationReq latitude(double? latitude) => this(latitude: latitude);

  @override
  SubstationReq longitude(double? longitude) => this(longitude: longitude);

  @override
  SubstationReq nomorGardu(String? nomorGardu) => this(nomorGardu: nomorGardu);

  @override
  SubstationReq petugas(String? petugas) => this(petugas: petugas);

  @override
  SubstationReq photo(String? photo) => this(photo: photo);

  @override
  SubstationReq surveyZoneTime(String? surveyZoneTime) => this(surveyZoneTime: surveyZoneTime);

  @override
  SubstationReq tanggalSurvey(String? tanggalSurvey) => this(tanggalSurvey: tanggalSurvey);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SubstationReq(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SubstationReq(...).copyWith(id: 12, name: "My name")
  /// ````
  SubstationReq call({
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
    return SubstationReq(
      akurasi: akurasi == const $CopyWithPlaceholder()
          ? _value.akurasi
          // ignore: cast_nullable_to_non_nullable
          : akurasi as double?,
      detailGardu: detailGardu == const $CopyWithPlaceholder()
          ? _value.detailGardu
          // ignore: cast_nullable_to_non_nullable
          : detailGardu as List<SubStationDetailReq>?,
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

extension $SubstationReqCopyWith on SubstationReq {
  /// Returns a callable class that can be used as follows: `instanceOfSubstationReq.copyWith(...)` or like so:`instanceOfSubstationReq.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SubstationReqCWProxy get copyWith => _$SubstationReqCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubstationReq _$SubstationReqFromJson(Map<String, dynamic> json) => SubstationReq(
      akurasi: (json['akurasi'] as num?)?.toDouble(),
      detailGardu: (json['detailGardu'] as List<dynamic>?)?.map((e) => SubStationDetailReq.fromJson(e as Map<String, dynamic>)).toList(),
      jumlahTrafo: json['jumlahTrafo'] as int?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      nomorGardu: json['nomorGardu'] as String?,
      petugas: json['petugas'] as String?,
      photo: json['photo'] as String?,
      surveyZoneTime: json['surveyZoneTime'] as String?,
      tanggalSurvey: json['tanggalSurvey'] as String?,
    );

Map<String, dynamic> _$SubstationReqToJson(SubstationReq instance) => <String, dynamic>{
      'akurasi': instance.akurasi,
      'detailGardu': instance.detailGardu?.map((e) => e.toJson()).toList(),
      'jumlahTrafo': instance.jumlahTrafo,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'nomorGardu': instance.nomorGardu,
      'petugas': instance.petugas,
      'photo': instance.photo,
      'surveyZoneTime': instance.surveyZoneTime,
      'tanggalSurvey': instance.tanggalSurvey,
    };
