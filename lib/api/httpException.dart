class HttpException implements Exception {
  late final message;

  HttpException(this.message);

  @override
  String toString() {
    return message;
  }
}
