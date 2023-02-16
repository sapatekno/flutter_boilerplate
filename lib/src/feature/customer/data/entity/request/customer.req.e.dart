import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../model/request/customer.req.dart';

part 'customer.req.e.g.dart';

@CopyWith()
class CustomerReqE extends Equatable {
  final double? akurasi;
  final String? idPel;
  final double? latitude;
  final double? longitude;
  final String? petugas;
  final String? surveyZoneTime;
  final String? tanggalSurvey;

  const CustomerReqE({
    required this.akurasi,
    required this.idPel,
    required this.latitude,
    required this.longitude,
    required this.petugas,
    required this.surveyZoneTime,
    required this.tanggalSurvey,
  });

  factory CustomerReqE.fromCustomerReq(CustomerReq data) {
    return CustomerReqE(
      akurasi: data.akurasi,
      idPel: data.idPel,
      latitude: data.latitude,
      longitude: data.longitude,
      petugas: data.petugas,
      surveyZoneTime: data.surveyZoneTime,
      tanggalSurvey: data.tanggalSurvey,
    );
  }

  CustomerReq toCustomerReq() {
    return CustomerReq(
      akurasi: akurasi,
      idPel: idPel,
      latitude: latitude,
      longitude: longitude,
      petugas: petugas,
      surveyZoneTime: surveyZoneTime,
      tanggalSurvey: tanggalSurvey,
    );
  }

  @override
  List<Object?> get props => [idPel, petugas, tanggalSurvey];

  factory CustomerReqE.initial() {
    return const CustomerReqE(
      akurasi: 0,
      idPel: '',
      latitude: 0,
      longitude: 0,
      petugas: '',
      surveyZoneTime: '',
      tanggalSurvey: '',
    );
  }
}
