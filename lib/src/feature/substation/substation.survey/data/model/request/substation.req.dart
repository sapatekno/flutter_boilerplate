import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:surveyami/src/feature/substation/substation.survey/data/model/request/substation_detail.req.dart';

part 'substation.req.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class SubstationReq extends Equatable {
  final int? akurasi;
  final List<SubStationDetailReq>? detailGardu;
  final int? jumlahTrafo;
  final double? latitude;
  final double? longitude;
  final String? nomorGardu;
  final String? petugas;
  final String? surveyZoneTime;
  final String? tanggalSurvey;

  const SubstationReq({
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

  factory SubstationReq.fromJson(Map<String, dynamic> json) => _$SubstationReqFromJson(json);

  Map<String, dynamic> toJson() => _$SubstationReqToJson(this);

  @override
  List<Object?> get props => [nomorGardu, tanggalSurvey];
}
