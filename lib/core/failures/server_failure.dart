import 'package:pokedex_clean_arch/core/errors/server_exception.dart';
import 'package:pokedex_clean_arch/core/failures/failure.dart';

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromException(ServerException e) {
    return ServerFailure(e.message);
  }
}
