import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    if (dioError.message!.contains('SocketException')) {
      return ServerFailure('No Internet Connection');
    }

    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with the server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout in connection with the server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout in connection with the server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to the server was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error occurred');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate received');

      default:
        return ServerFailure('Unexpected Error, Please try again!');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['status_message'] ??
          'Oops There was an Error, Please try again');
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later!');
    } else {
      return ServerFailure('Oops There was an Error, Please try again');
    }
  }
}
