import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:surveyami/src/feature/substation/substation.survey/data/model/request/substation_detail.req.dart';

part 'substation_detail.req.e.g.dart';

@CopyWith()
class SubStationDetailReqE extends Equatable {
  final int? jumlahSaluran;
  final int? kapasitasTrafo;
  final String? nomorTrafo;

  const SubStationDetailReqE({
    required this.jumlahSaluran,
    required this.kapasitasTrafo,
    required this.nomorTrafo,
  });

  factory SubStationDetailReqE.fromSubStationDetailReq(SubStationDetailReq data) {
    return SubStationDetailReqE(
      jumlahSaluran: data.jumlahSaluran,
      kapasitasTrafo: data.kapasitasTrafo,
      nomorTrafo: data.nomorTrafo,
    );
  }

  SubStationDetailReq toSubStationDetailReq() {
    return SubStationDetailReq(
      jumlahSaluran: jumlahSaluran,
      kapasitasTrafo: kapasitasTrafo,
      nomorTrafo: nomorTrafo,
    );
  }

  @override
  List<Object?> get props => [nomorTrafo, kapasitasTrafo, jumlahSaluran];
}
