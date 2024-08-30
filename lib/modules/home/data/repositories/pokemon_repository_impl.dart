import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_clean_arch/core/errors/server_exception.dart';
import 'package:pokedex_clean_arch/core/failures/failure.dart';
import 'package:pokedex_clean_arch/core/failures/server_failure.dart';
import 'package:pokedex_clean_arch/modules/home/data/datasources/pokemon_datasource.dart';
import 'package:pokedex_clean_arch/modules/home/domain/entities/pokemon_base_entity.dart';
import 'package:pokedex_clean_arch/modules/home/domain/repositories/pokemon_repository.dart';

@LazySingleton(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource _datasource;

  PokemonRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, List<PokemonBaseEntity>>> fetchPokemonBaseList(int pageNumber) async {
    try {
      return Right(await _datasource.fetchPokemonBaseList(pageNumber));
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
