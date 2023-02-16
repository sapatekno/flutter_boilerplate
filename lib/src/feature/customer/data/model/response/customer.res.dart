import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer.res.g.dart';

@CopyWith()
@JsonSerializable()
class CustomerRes extends Equatable {
  final String? idpel;
  final String? nama;
  final String? tarif;
  final int? daya;
  final double? latitude;
  final double? longitude;
  final String? nomorGardu;
  final String? alamat;

  const CustomerRes({
    required this.idpel,
    required this.nama,
    required this.tarif,
    required this.daya,
    required this.latitude,
    required this.longitude,
    required this.nomorGardu,
    required this.alamat,
  });

  factory CustomerRes.fromJson(Map<String, dynamic> json) => _$CustomerResFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerResToJson(this);

  @override
  List<Object?> get props => [idpel, nama, tarif, daya];
}
