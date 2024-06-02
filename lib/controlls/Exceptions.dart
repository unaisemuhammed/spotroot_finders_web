// ignore_for_file: file_names


import 'package:spotrootweb/widgets/utilis.dart';

class UserException implements Exception {
  String cause;
  UserException(this.cause);
}

class Failure {
  // Use something like "int code;" if you want to translate error messages
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

class ApiExceptionHandler {
  static statusCode(
    int? statusCode,
  ) {
    switch (statusCode) {
      case 401:
        Utilis.snackBar(
            title: 'Exception',
            message: 'Something went wrong, Please try again');
      //logout
      case 400:
        Utilis.snackBar(
            title: 'Exception',
            message: 'Somthing went wrong, Please try again');
      case 500:
        Utilis.snackBar(
            title: 'Exception',
            message: 'Somthing went wrong, Please try again');
    }
  }
}
