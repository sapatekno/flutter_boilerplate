// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'substation_detail.req.e.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SubStationDetailReqECWProxy {
  SubStationDetailReqE jumlahSaluran(int? jumlahSaluran);

  SubStationDetailReqE kapasitasTrafo(int? kapasitasTrafo);

  SubStationDetailReqE nomorTrafo(String? nomorTrafo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SubStationDetailReqE(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SubStationDetailReqE(...).copyWith(id: 12, name: "My name")
  /// ````
  SubStationDetailReqE call({
    int? jumlahSaluran,
    int? kapasitasTrafo,
    String? nomorTrafo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSubStationDetailReqE.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSubStationDetailReqE.copyWith.fieldName(...)`
class _$SubStationDetailReqECWProxyImpl implements _$SubStationDetailReqECWProxy {
  const _$SubStationDetailReqECWProxyImpl(this._value);

  final SubStationDetailReqE _value;

  @override
  SubStationDetailReqE jumlahSaluran(int? jumlahSaluran) => this(jumlahSaluran: jumlahSaluran);

  @override
  SubStationDetailReqE kapasitasTrafo(int? kapasitasTrafo) => this(kapasitasTrafo: kapasitasTrafo);

  @override
  SubStationDetailReqE nomorTrafo(String? nomorTrafo) => this(nomorTrafo: nomorTrafo);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SubStationDetailReqE(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SubStationDetailReqE(...).copyWith(id: 12, name: "My name")
  /// ````
  SubStationDetailReqE call({
    Object? jumlahSaluran = const $CopyWithPlaceholder(),
    Object? kapasitasTrafo = const $CopyWithPlaceholder(),
    Object? nomorTrafo = const $CopyWithPlaceholder(),
  }) {
    return SubStationDetailReqE(
      jumlahSaluran: jumlahSaluran == const $CopyWithPlaceholder()
          ? _value.jumlahSaluran
          // ignore: cast_nullable_to_non_nullable
          : jumlahSaluran as int?,
      kapasitasTrafo: kapasitasTrafo == const $CopyWithPlaceholder()
          ? _value.kapasitasTrafo
          // ignore: cast_nullable_to_non_nullable
          : kapasitasTrafo as int?,
      nomorTrafo: nomorTrafo == const $CopyWithPlaceholder()
          ? _value.nomorTrafo
          // ignore: cast_nullable_to_non_nullable
          : nomorTrafo as String?,
    );
  }
}

extension $SubStationDetailReqECopyWith on SubStationDetailReqE {
  /// Returns a callable class that can be used as follows: `instanceOfSubStationDetailReqE.copyWith(...)` or like so:`instanceOfSubStationDetailReqE.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SubStationDetailReqECWProxy get copyWith => _$SubStationDetailReqECWProxyImpl(this);
}
