import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../model/response/customer.res.dart';

part 'customer.res.e.g.dart';

@CopyWith()
class CustomerResE extends Equatable {
  final String? idpel;
  final String? nama;
  final String? tarif;
  final int? daya;
  final double? latitude;
  final double? longitude;
  final String? nomorGardu;
  final String? alamat;

  const CustomerResE({
    required this.idpel,
    required this.nama,
    required this.tarif,
    required this.daya,
    required this.latitude,
    required this.longitude,
    required this.nomorGardu,
    required this.alamat,
  });

  factory CustomerResE.fromCustomerRes(CustomerRes data) {
    return CustomerResE(
      idpel: data.idpel,
      nama: data.nama,
      tarif: data.tarif,
      daya: data.daya,
      latitude: data.latitude,
      longitude: data.longitude,
      nomorGardu: data.nomorGardu,
      alamat: data.alamat,
    );
  }

  CustomerRes toCustomerRes() {
    return CustomerRes(
      idpel: idpel,
      nama: nama,
      tarif: tarif,
      daya: daya,
      latitude: latitude,
      longitude: longitude,
      nomorGardu: nomorGardu,
      alamat: alamat,
    );
  }

  @override
  List<Object?> get props => [idpel, nama, tarif, daya];
}
