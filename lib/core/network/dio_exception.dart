// Import the necessary package.
import 'package:dio/dio.dart';
import 'package:flutter_frontend/core/app_export.dart';

// Create a custom exception class for handling Dio errors.
class DioException implements Exception {
  late String errorMessage;

  // Constructor to create a DioException from a DioError.
  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorMessage = 'Request to the server was cancelled.';
        break;
      case DioErrorType.connectionTimeout:
        errorMessage = 'Connection timed out.';
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = 'Receiving timeout occurred.';
        break;
      case DioErrorType.sendTimeout:
        errorMessage = 'Request send timeout.';
        break;
      case DioErrorType.badResponse:
        errorMessage = _handleStatusCode(dioError.response?.statusCode);
        break;
      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          // Display a snackbar when there's no internet connection.
          Get.snackbar('Alert', 'No Internet Connection');
          errorMessage = 'No Internet.';
          break;
        }
        errorMessage = 'Unexpected error occurred.';
        break;
      default:
        errorMessage = 'Something went wrong';
        break;
    }
  }

  // Helper function to handle HTTP status codes.
  String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request.';
      case 401:
        return 'Authentication failed.';
      case 403:
        return 'The authenticated user is not allowed to access the specified API endpoint.';
      case 404:
        return 'The requested resource does not exist.';
      case 405:
        return 'Method not allowed. Please check the Allow header for the allowed HTTP methods.';
      case 415:
        return 'Unsupported media type. The requested content type or version number is invalid.';
      case 422:
        return 'Data validation failed.';
      case 429:
        return 'Too many requests.';
      case 500:
        return 'Internal server error.';
      case 503:
        return 'Service Unavailable.';
      default:
        return 'Oops something went wrong!';
    }
  }

  // Override the toString method to provide a string representation of the exception.
  @override
  String toString() => errorMessage;
}
