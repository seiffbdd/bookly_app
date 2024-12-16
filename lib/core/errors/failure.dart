import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailer extends Failure {
  ServerFailer({required super.errMessage});

  factory ServerFailer.fromDioException(DioException exp) {
    switch (exp.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailer(errMessage: 'Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailer(errMessage: 'Send timeout with api server');

      case DioExceptionType.receiveTimeout:
        return ServerFailer(errMessage: 'Receive timeout with api server');

      case DioExceptionType.badCertificate:
        return ServerFailer(errMessage: 'Bad Certificate');

      case DioExceptionType.badResponse:
        return ServerFailer.fromResponse(
            statusCode: exp.response!.statusCode!,
            response: exp.response!.data);
      case DioExceptionType.cancel:
        return ServerFailer(errMessage: 'Request Canceled');
      case DioExceptionType.connectionError:
        return ServerFailer(errMessage: 'Not connected to the internet');
      case DioExceptionType.unknown:
        return ServerFailer(
            errMessage: 'Unexpected error! please try again later');
    }
  }

  factory ServerFailer.fromResponse(
      {required int statusCode, required dynamic response}) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailer(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailer(
          errMessage: 'Your request not found! please try again later');
    } else if (statusCode == 500) {
      return ServerFailer(errMessage: 'Server error!, please try again later');
    } else {
      return ServerFailer(
          errMessage: 'Oop, there was an error, please try again later');
    }
  }
}
