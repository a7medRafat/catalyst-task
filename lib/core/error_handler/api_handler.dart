import 'package:dio/dio.dart';

class ApiErrorHandler {
  static String parseError(dynamic errorResponse) {
    if (errorResponse is Map<String, dynamic>) {
      if (errorResponse.containsKey('messages')) {
        final messages = errorResponse['messages'];
        if (messages is Map<String, dynamic>) {
          return messages.entries
              .map((entry) => entry.value is List
                  ? entry.value.join(', ')
                  : entry.value.toString())
              .join('. ');
        }
      }
      return errorResponse['error'] ?? 'An unexpected error occurred.';
    }
    return 'An unknown error occurred.';
  }

  static String handleDioError(DioException dioError) {
    final response = dioError.response;
    if (response != null && response.data != null) {
      return parseError(response.data);
    }
    return 'Network error: ${dioError.message}';
  }
}
