// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'substation_detail.req.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SubStationDetailReqCWProxy {
  SubStationDetailReq jumlahSaluran(int? jumlahSaluran);

  SubStationDetailReq kapasitasTrafo(int? kapasitasTrafo);

  SubStationDetailReq nomorTrafo(String? nomorTrafo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SubStationDetailReq(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SubStationDetailReq(...).copyWith(id: 12, name: "My name")
  /// ````
  SubStationDetailReq call({
    int? jumlahSaluran,
    int? kapasitasTrafo,
    String? nomorTrafo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSubStationDetailReq.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSubStationDetailReq.copyWith.fieldName(...)`
class _$SubStationDetailReqCWProxyImpl implements _$SubStationDetailReqCWProxy {
  const _$SubStationDetailReqCWProxyImpl(this._value);

  final SubStationDetailReq _value;

  @override
  SubStationDetailReq jumlahSaluran(int? jumlahSaluran) => this(jumlahSaluran: jumlahSaluran);

  @override
  SubStationDetailReq kapasitasTrafo(int? kapasitasTrafo) => this(kapasitasTrafo: kapasitasTrafo);

  @override
  SubStationDetailReq nomorTrafo(String? nomorTrafo) => this(nomorTrafo: nomorTrafo);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SubStationDetailReq(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SubStationDetailReq(...).copyWith(id: 12, name: "My name")
  /// ````
  SubStationDetailReq call({
    Object? jumlahSaluran = const $CopyWithPlaceholder(),
    Object? kapasitasTrafo = const $CopyWithPlaceholder(),
    Object? nomorTrafo = const $CopyWithPlaceholder(),
  }) {
    return SubStationDetailReq(
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

extension $SubStationDetailReqCopyWith on SubStationDetailReq {
  /// Returns a callable class that can be used as follows: `instanceOfSubStationDetailReq.copyWith(...)` or like so:`instanceOfSubStationDetailReq.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SubStationDetailReqCWProxy get copyWith => _$SubStationDetailReqCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubStationDetailReq _$SubStationDetailReqFromJson(Map<String, dynamic> json) => SubStationDetailReq(
      jumlahSaluran: json['jumlahSaluran'] as int?,
      kapasitasTrafo: json['kapasitasTrafo'] as int?,
      nomorTrafo: json['nomorTrafo'] as String?,
    );

Map<String, dynamic> _$SubStationDetailReqToJson(SubStationDetailReq instance) => <String, dynamic>{
      'jumlahSaluran': instance.jumlahSaluran,
      'kapasitasTrafo': instance.kapasitasTrafo,
      'nomorTrafo': instance.nomorTrafo,
    };
