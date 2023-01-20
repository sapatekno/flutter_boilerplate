import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/response/res_pageable.dart';

part 'pageable.g.dart';

@CopyWith()
class Pageable<T> extends Equatable {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<T>? data;

  const Pageable({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory Pageable.fromResPageable(
      ResPageable data, T Function(Object? dataT) fromDataT) {
    return Pageable(
      page: data.page,
      perPage: data.perPage,
      total: data.total,
      totalPages: data.totalPages,
      data: data.data?.map(fromDataT).toList(),
    );
  }

  @override
  List<Object?> get props => [page, total];
}
