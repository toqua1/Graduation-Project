import 'package:dio/dio.dart';

class DioErrorHandler {
  static String handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return 'Connection timed out. Please check your internet connection.';
    } else if (e.type == DioExceptionType.connectionError) {
      return 'No internet connection. Please check your network and try again.';
    } else if (e.type == DioExceptionType.badResponse) {
      int? statusCode = e.response?.statusCode;
      if (statusCode == 400) {
        return e.response?.data['message'] ?? 'Invalid request. Please check your input.';
      } else if (statusCode == 401) {
        return 'Unauthorized. Please check your credentials.';
      } else if (statusCode == 403) {
        return 'You do not have permission to access this resource.';
      } else if (statusCode == 404) {
        return 'The requested resource was not found.';
      } else if (statusCode == 500) {
        return 'Server error. Please try again later.';
      } else {
        return 'Something went wrong. Please try again.';
      }
    } else if (e.type == DioExceptionType.cancel) {
      return 'Request was cancelled. Please try again.';
    } else {
      return 'Unexpected error occurred. Please try again.';
    }
  }
}
