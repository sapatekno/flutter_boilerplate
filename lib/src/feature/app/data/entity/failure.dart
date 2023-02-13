import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:surveyami/src/util/string.util.dart';

part 'failure.g.dart';

@CopyWith()
class Failure extends Equatable {
  final bool isProcessed;
  final String? message;
  final String? detail;
  final dynamic error;
  final StackTrace? stackTrace;

  const Failure({
    this.isProcessed = false,
    this.message,
    this.detail,
    this.error,
    this.stackTrace,
  });

  static Failure fromNoResponseFromApi(Response response) {
    String message = 'noresponsefromapi';
    String detail = '';
    detail += 'url : ${response.requestOptions.baseUrl}${response.requestOptions.path}\n';
    detail += 'status : ${response.statusCode}\n';

    return Failure(
      isProcessed: true,
      message: message,
      detail: detail,
    );
  }

  static Failure fromNoInternetConnection() {
    String message = 'fromNoInternetConnection';
    String detail = '';

    return Failure(
      isProcessed: true,
      message: message,
      detail: detail,
    );
  }

  @override
  List<Object?> get props => [isProcessed, message, error, stackTrace];

  static Failure proccess(Failure data) {
    if (data.isProcessed == true) return data;
    var result = data.copyWith(isProcessed: true);

    if (result.error is DioError) {
      var dioError = result.error as DioError;
      String message = dioError.response?.data['message'] ?? dioError.message;
      result = result.copyWith(message: message.toCapitalize());
    }

    return result;
  }

  static String getMessage(BuildContext context, String message) {
    if (message == 'fromNoInternetConnection') return AppLocalizations.of(context)!.failNoInternet;

    return message;
  }
}
