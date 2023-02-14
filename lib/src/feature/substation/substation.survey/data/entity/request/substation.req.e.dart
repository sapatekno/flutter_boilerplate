import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../model/request/substation.req.dart';
import '../../model/request/substation_detail.req.dart';

part 'substation.req.e.g.dart';

@CopyWith()
class SubstationReqE extends Equatable {
  final int? akurasi;
  final List<SubStationDetailReq>? detailGardu;
  final int? jumlahTrafo;
  final double? latitude;
  final double? longitude;
  final String? nomorGardu;
  final String? petugas;
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
    required this.surveyZoneTime,
    required this.tanggalSurvey,
  });

  factory SubstationReqE.fromSubstationReq(SubstationReq data) {
    return SubstationReqE(
      akurasi: data.akurasi,
      detailGardu: data.detailGardu,
      jumlahTrafo: data.jumlahTrafo,
      latitude: data.latitude,
      longitude: data.longitude,
      nomorGardu: data.nomorGardu,
      petugas: data.petugas,
      surveyZoneTime: data.surveyZoneTime,
      tanggalSurvey: data.tanggalSurvey,
    );
  }

  SubstationReq toSubstationReq() {
    return SubstationReq(
      akurasi: akurasi,
      detailGardu: detailGardu,
      jumlahTrafo: jumlahTrafo,
      latitude: latitude,
      longitude: longitude,
      nomorGardu: nomorGardu,
      petugas: petugas,
      surveyZoneTime: surveyZoneTime,
      tanggalSurvey: tanggalSurvey,
    );
  }

  @override
  List<Object?> get props => [nomorGardu, tanggalSurvey];
}
