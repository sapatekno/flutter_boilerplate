// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.res.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CustomerResCWProxy {
  CustomerRes idpel(String? idpel);

  CustomerRes nama(String? nama);

  CustomerRes tarif(String? tarif);

  CustomerRes daya(int? daya);

  CustomerRes latitude(double? latitude);

  CustomerRes longitude(double? longitude);

  CustomerRes nomorGardu(String? nomorGardu);

  CustomerRes alamat(String? alamat);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CustomerRes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CustomerRes(...).copyWith(id: 12, name: "My name")
  /// ````
  CustomerRes call({
    String? idpel,
    String? nama,
    String? tarif,
    int? daya,
    double? latitude,
    double? longitude,
    String? nomorGardu,
    String? alamat,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCustomerRes.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCustomerRes.copyWith.fieldName(...)`
class _$CustomerResCWProxyImpl implements _$CustomerResCWProxy {
  const _$CustomerResCWProxyImpl(this._value);

  final CustomerRes _value;

  @override
  CustomerRes idpel(String? idpel) => this(idpel: idpel);

  @override
  CustomerRes nama(String? nama) => this(nama: nama);

  @override
  CustomerRes tarif(String? tarif) => this(tarif: tarif);

  @override
  CustomerRes daya(int? daya) => this(daya: daya);

  @override
  CustomerRes latitude(double? latitude) => this(latitude: latitude);

  @override
  CustomerRes longitude(double? longitude) => this(longitude: longitude);

  @override
  CustomerRes nomorGardu(String? nomorGardu) => this(nomorGardu: nomorGardu);

  @override
  CustomerRes alamat(String? alamat) => this(alamat: alamat);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CustomerRes(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CustomerRes(...).copyWith(id: 12, name: "My name")
  /// ````
  CustomerRes call({
    Object? idpel = const $CopyWithPlaceholder(),
    Object? nama = const $CopyWithPlaceholder(),
    Object? tarif = const $CopyWithPlaceholder(),
    Object? daya = const $CopyWithPlaceholder(),
    Object? latitude = const $CopyWithPlaceholder(),
    Object? longitude = const $CopyWithPlaceholder(),
    Object? nomorGardu = const $CopyWithPlaceholder(),
    Object? alamat = const $CopyWithPlaceholder(),
  }) {
    return CustomerRes(
      idpel: idpel == const $CopyWithPlaceholder()
          ? _value.idpel
          // ignore: cast_nullable_to_non_nullable
          : idpel as String?,
      nama: nama == const $CopyWithPlaceholder()
          ? _value.nama
          // ignore: cast_nullable_to_non_nullable
          : nama as String?,
      tarif: tarif == const $CopyWithPlaceholder()
          ? _value.tarif
          // ignore: cast_nullable_to_non_nullable
          : tarif as String?,
      daya: daya == const $CopyWithPlaceholder()
          ? _value.daya
          // ignore: cast_nullable_to_non_nullable
          : daya as int?,
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
      alamat: alamat == const $CopyWithPlaceholder()
          ? _value.alamat
          // ignore: cast_nullable_to_non_nullable
          : alamat as String?,
    );
  }
}

extension $CustomerResCopyWith on CustomerRes {
  /// Returns a callable class that can be used as follows: `instanceOfCustomerRes.copyWith(...)` or like so:`instanceOfCustomerRes.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CustomerResCWProxy get copyWith => _$CustomerResCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerRes _$CustomerResFromJson(Map<String, dynamic> json) => CustomerRes(
      idpel: json['idpel'] as String?,
      nama: json['nama'] as String?,
      tarif: json['tarif'] as String?,
      daya: json['daya'] as int?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      nomorGardu: json['nomorGardu'] as String?,
      alamat: json['alamat'] as String?,
    );

Map<String, dynamic> _$CustomerResToJson(CustomerRes instance) => <String, dynamic>{
      'idpel': instance.idpel,
      'nama': instance.nama,
      'tarif': instance.tarif,
      'daya': instance.daya,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'nomorGardu': instance.nomorGardu,
      'alamat': instance.alamat,
    };
