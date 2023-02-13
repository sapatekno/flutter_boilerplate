import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base.res.g.dart';

@CopyWith()
@JsonSerializable(genericArgumentFactories: true)
class BaseRes<T> extends Equatable {
  final int? code;
  final String? message;
  final bool? success;
  final T? data;

  const BaseRes({
    required this.code,
    required this.message,
    required this.success,
    required this.data,
  });

  factory BaseRes.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$BaseResFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$BaseResToJson(this, toJsonT);

  @override
  List<Object?> get props => [code, success];
}
