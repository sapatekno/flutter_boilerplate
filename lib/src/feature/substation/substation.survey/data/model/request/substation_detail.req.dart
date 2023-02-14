import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'substation_detail.req.g.dart';

@CopyWith()
@JsonSerializable()
class SubStationDetailReq extends Equatable {
  final int? jumlahSaluran;
  final int? kapasitasTrafo;
  final String? nomorTrafo;

  const SubStationDetailReq({
    required this.jumlahSaluran,
    required this.kapasitasTrafo,
    required this.nomorTrafo,
  });

  factory SubStationDetailReq.fromJson(Map<String, dynamic> json) => _$SubStationDetailReqFromJson(json);

  Map<String, dynamic> toJson() => _$SubStationDetailReqToJson(this);

  @override
  List<Object?> get props => [nomorTrafo, kapasitasTrafo, jumlahSaluran];
}
