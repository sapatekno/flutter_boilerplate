import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../model/response/substation.res.dart';

part 'substation.res.e.g.dart';

@CopyWith()
class SubStationResE extends Equatable {
  final String? nomorGardu;
  final String? typeGardu;
  final double? latitude;
  final double? longitude;
  final String? description;

  const SubStationResE({
    required this.nomorGardu,
    required this.typeGardu,
    required this.latitude,
    required this.longitude,
    required this.description,
  });

  factory SubStationResE.fromSubStationRes(SubStationRes data) {
    return SubStationResE(
      nomorGardu: data.nomorGardu,
      typeGardu: data.typeGardu,
      latitude: data.latitude,
      longitude: data.longitude,
      description: data.description,
    );
  }

  SubStationRes toSubStationRes() {
    return SubStationRes(
      nomorGardu: nomorGardu,
      typeGardu: typeGardu,
      latitude: latitude,
      longitude: longitude,
      description: description,
    );
  }

  @override
  List<Object?> get props => [nomorGardu, typeGardu];
}
