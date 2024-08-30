class ServerException implements Exception {
  ServerException(this.message) : super();

  final String message;
}
