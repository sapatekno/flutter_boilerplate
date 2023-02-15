import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../model/request/substation.req.dart';
import 'substation_detail.req.e.dart';

part 'substation.req.e.g.dart';

@CopyWith()
class SubstationReqE extends Equatable {
  final double? akurasi;
  final List<SubStationDetailReqE>? detailGardu;
  final int? jumlahTrafo;
  final double? latitude;
  final double? longitude;
  final String? nomorGardu;
  final String? petugas;
  final String? photo;
  final String? surveyZoneTime;
  final String? tanggalSurvey;

  const SubstationReqE({
    required this.akurasi,
    required this.detailGardu,
    required this.jumlahTrafo,
    required this.latitude,
    required this.longitude,
    required this.nomorGardu,
    required this.petugas,
    required this.photo,
    required this.surveyZoneTime,
    required this.tanggalSurvey,
  });

  factory SubstationReqE.initial() {
    return const SubstationReqE(
      akurasi: 0,
      detailGardu: [],
      jumlahTrafo: 0,
      latitude: 0,
      longitude: 0,
      nomorGardu: '',
      petugas: '',
      photo: '',
      surveyZoneTime: '',
      tanggalSurvey: '',
    );
  }

  factory SubstationReqE.fromSubstationReq(SubstationReq data) {
    return SubstationReqE(
      akurasi: data.akurasi,
      detailGardu: data.detailGardu == null ? null : data.detailGardu!.map((e) => SubStationDetailReqE.fromSubStationDetailReq(e)).toList(),
      jumlahTrafo: data.jumlahTrafo,
      latitude: data.latitude,
      longitude: data.longitude,
      nomorGardu: data.nomorGardu,
      petugas: data.petugas,
      photo: data.photo,
      surveyZoneTime: data.surveyZoneTime,
      tanggalSurvey: data.tanggalSurvey,
    );
  }

  SubstationReq toSubstationReq() {
    return SubstationReq(
      akurasi: akurasi,
      detailGardu: detailGardu == null ? null : detailGardu!.map((e) => e.toSubStationDetailReq()).toList(),
      jumlahTrafo: jumlahTrafo,
      latitude: latitude,
      longitude: longitude,
      nomorGardu: nomorGardu,
      petugas: petugas,
      photo: photo,
      surveyZoneTime: surveyZoneTime,
      tanggalSurvey: tanggalSurvey,
    );
  }

  @override
  List<Object?> get props => [nomorGardu, tanggalSurvey];
}
