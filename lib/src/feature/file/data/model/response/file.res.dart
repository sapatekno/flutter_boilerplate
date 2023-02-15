import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file.res.g.dart';

@CopyWith()
@JsonSerializable()
class FileRes extends Equatable {
  final String? path;
  final bool? success;

  const FileRes({required this.path, required this.success});

  factory FileRes.fromJson(Map<String, dynamic> json) => _$FileResFromJson(json);

  Map<String, dynamic> toJson() => _$FileResToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [path];
}
