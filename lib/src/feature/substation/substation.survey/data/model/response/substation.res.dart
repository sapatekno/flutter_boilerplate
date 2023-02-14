import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'substation.res.g.dart';

@CopyWith()
@JsonSerializable()
class SubStationRes extends Equatable {
  final String? nomorGardu;
  final String? typeGardu;
  final double? latitude;
  final double? longitude;
  final String? description;

  const SubStationRes({
    required this.nomorGardu,
    required this.typeGardu,
    required this.latitude,
    required this.longitude,
    required this.description,
  });

  factory SubStationRes.fromJson(Map<String, dynamic> json) => _$SubStationResFromJson(json);

  Map<String, dynamic> toJson() => _$SubStationResToJson(this);

  @override
  List<Object?> get props => [nomorGardu, typeGardu];
}
