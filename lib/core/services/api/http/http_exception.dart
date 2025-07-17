sealed class HttpException implements Exception {
  final String message;
  HttpException(this.message);
}

class HttpNetworkException extends HttpException {
  HttpNetworkException([super.msg = "No internet"]);
}

class HttpTimeoutException extends HttpException {
  HttpTimeoutException([super.msg = "Request timed out"]);
}

class HttpServerException extends HttpException {
  final int statusCode;
  HttpServerException(this.statusCode, [super.msg = "Server error"]);
}