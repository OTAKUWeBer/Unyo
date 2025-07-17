
class ApiResponse<T> {
  final T data;
  final int statusCode;
  final Map<String, String> headers;

  ApiResponse({
    required this.data,
    required this.statusCode,
    required this.headers,
  });
}