import 'package:flutter/foundation.dart';

class ApiResponse<T> {
  final T data;
  final Uint8List bodyBytes;
  final int statusCode;
  final Map<String, String> headers;

  ApiResponse({
    required this.data,
    required this.bodyBytes,
    required this.statusCode,
    required this.headers,
  });
}