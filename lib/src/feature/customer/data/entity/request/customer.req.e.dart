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
  final String? merekMeter;
  final String? nomorMeter;
  final String? petugas;
  final String? photo;
  final String? rst;
  final String? sl;
  final int? sr;
  final double? standAkhir;
  final String? surveyZoneTime;
  final String? tanggalSurvey;

  const CustomerReqE({
    required this.akurasi,
    required this.idPel,
    required this.latitude,
    required this.longitude,
    required this.merekMeter,
    required this.nomorMeter,
    required this.petugas,
    required this.photo,
    required this.rst,
    required this.sl,
    required this.sr,
    required this.standAkhir,
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
      merekMeter: data.merekMeter,
      nomorMeter: data.nomorMeter,
      photo: data.photo,
      rst: data.rst,
      sl: data.sl,
      sr: data.sr,
      standAkhir: data.standAkhir,
    );
  }

  CustomerReq toCustomerReq() {
    return CustomerReq(
      akurasi: akurasi,
      idPel: idPel,
      latitude: latitude,
      longitude: longitude,
      merekMeter: merekMeter,
      nomorMeter: nomorMeter,
      petugas: petugas,
      photo: photo,
      rst: rst,
      sl: sl,
      sr: sr,
      standAkhir: standAkhir,
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
      merekMeter: '',
      nomorMeter: '',
      photo: '',
      rst: '',
      sl: '',
      sr: 0,
      standAkhir: 0,
    );
  }
}
