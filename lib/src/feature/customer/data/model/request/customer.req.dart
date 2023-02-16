import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer.req.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class CustomerReq extends Equatable {
  final double? akurasi;
  final String? idPel;
  final double? latitude;
  final double? longitude;
  final String? petugas;
  final String? surveyZoneTime;
  final String? tanggalSurvey;

  const CustomerReq({
    required this.akurasi,
    required this.idPel,
    required this.latitude,
    required this.longitude,
    required this.petugas,
    required this.surveyZoneTime,
    required this.tanggalSurvey,
  });

  factory CustomerReq.fromJson(Map<String, dynamic> json) => _$CustomerReqFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerReqToJson(this);

  @override
  List<Object?> get props => [idPel, petugas, tanggalSurvey];
}
