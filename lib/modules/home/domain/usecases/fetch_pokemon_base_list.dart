import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_clean_arch/core/failures/failure.dart';
import 'package:pokedex_clean_arch/modules/home/domain/entities/pokemon_base_entity.dart';
import 'package:pokedex_clean_arch/modules/home/domain/repositories/pokemon_repository.dart';

abstract class FetchPokemonBaseList {
  Future<Either<Failure, List<PokemonBaseEntity>>> call(int pageNumber);
}

@LazySingleton(as: FetchPokemonBaseList)
class FetchPokemonBaseListImpl implements FetchPokemonBaseList {
  final PokemonRepository _repository;

  const FetchPokemonBaseListImpl(this._repository);

  @override
  Future<Either<Failure, List<PokemonBaseEntity>>> call(int pageNumber) async {
    return await _repository.fetchPokemonBaseList(pageNumber);
  }
}
