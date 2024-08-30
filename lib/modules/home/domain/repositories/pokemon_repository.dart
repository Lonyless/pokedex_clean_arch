import "package:dartz/dartz.dart";

import "package:pokedex_clean_arch/core/failures/failure.dart";

import "package:pokedex_clean_arch/modules/home/domain/entities/pokemon_base_entity.dart";

abstract class PokemonRepository {
  Future<Either<Failure, List<PokemonBaseEntity>>> fetchPokemonBaseList(int pageNumber);
}
