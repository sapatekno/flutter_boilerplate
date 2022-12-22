import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'res_pageable.g.dart';

@CopyWith()
@JsonSerializable(genericArgumentFactories: true)
class ResPageable<T> extends Equatable {
  final int? page;
  @JsonKey(name: 'per_page')
  final int? perPage;
  final int? total;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  final List<T>? data;

  const ResPageable({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory ResPageable.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$ResPageableFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$ResPageableToJson(this, toJsonT);

  @override
  List<Object?> get props => [page, total];
}
