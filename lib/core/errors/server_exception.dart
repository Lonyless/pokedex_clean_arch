class ServerException implements Exception {
  ServerException({required this.message, required this.statusCode}) : super();

  final String message;
  final int? statusCode;
}
