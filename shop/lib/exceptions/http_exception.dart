class HttpExceptionTest implements Exception {
  final String msg;
  final int statusCode;

  HttpExceptionTest({required this.msg, required this.statusCode});

  @override
  String toString() {
    return msg;
  }
}
