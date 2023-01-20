import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

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
    detail +=
        'url : ${response.requestOptions.baseUrl}${response.requestOptions.path}\n';
    detail += 'status : ${response.statusCode}\n';

    return Failure(
      isProcessed: true,
      message: message,
      detail: detail,
    );
  }

  @override
  List<Object?> get props => [isProcessed, message, error, stackTrace];
}
