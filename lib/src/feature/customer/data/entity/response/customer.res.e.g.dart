// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.res.e.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CustomerResECWProxy {
  CustomerResE idpel(String? idpel);

  CustomerResE nama(String? nama);

  CustomerResE tarif(String? tarif);

  CustomerResE daya(int? daya);

  CustomerResE latitude(double? latitude);

  CustomerResE longitude(double? longitude);

  CustomerResE nomorGardu(String? nomorGardu);

  CustomerResE alamat(String? alamat);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CustomerResE(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CustomerResE(...).copyWith(id: 12, name: "My name")
  /// ````
  CustomerResE call({
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

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCustomerResE.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCustomerResE.copyWith.fieldName(...)`
class _$CustomerResECWProxyImpl implements _$CustomerResECWProxy {
  const _$CustomerResECWProxyImpl(this._value);

  final CustomerResE _value;

  @override
  CustomerResE idpel(String? idpel) => this(idpel: idpel);

  @override
  CustomerResE nama(String? nama) => this(nama: nama);

  @override
  CustomerResE tarif(String? tarif) => this(tarif: tarif);

  @override
  CustomerResE daya(int? daya) => this(daya: daya);

  @override
  CustomerResE latitude(double? latitude) => this(latitude: latitude);

  @override
  CustomerResE longitude(double? longitude) => this(longitude: longitude);

  @override
  CustomerResE nomorGardu(String? nomorGardu) => this(nomorGardu: nomorGardu);

  @override
  CustomerResE alamat(String? alamat) => this(alamat: alamat);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CustomerResE(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CustomerResE(...).copyWith(id: 12, name: "My name")
  /// ````
  CustomerResE call({
    Object? idpel = const $CopyWithPlaceholder(),
    Object? nama = const $CopyWithPlaceholder(),
    Object? tarif = const $CopyWithPlaceholder(),
    Object? daya = const $CopyWithPlaceholder(),
    Object? latitude = const $CopyWithPlaceholder(),
    Object? longitude = const $CopyWithPlaceholder(),
    Object? nomorGardu = const $CopyWithPlaceholder(),
    Object? alamat = const $CopyWithPlaceholder(),
  }) {
    return CustomerResE(
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

extension $CustomerResECopyWith on CustomerResE {
  /// Returns a callable class that can be used as follows: `instanceOfCustomerResE.copyWith(...)` or like so:`instanceOfCustomerResE.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CustomerResECWProxy get copyWith => _$CustomerResECWProxyImpl(this);
}
