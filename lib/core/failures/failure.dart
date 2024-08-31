import 'package:pokedex_clean_arch/core/errors/server_exception.dart';
import 'package:pokedex_clean_arch/core/failures/not_found_failure.dart';
import 'package:pokedex_clean_arch/core/failures/server_failure.dart';

abstract class Failure {
  final String message;

  Failure(this.message);

  factory Failure.fromServerException(ServerException e) {
    if (e.statusCode == null) {
      return ServerFailure(e.message);
    } else {
      if (e.statusCode == 404) {
        return NotFoundFailure(e.message);
      }
    }

    return ServerFailure(e.message);
  }
}
