import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_clean_arch/core/failures/failure.dart';
import 'package:pokedex_clean_arch/modules/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_clean_arch/modules/home/domain/repositories/pokemon_repository.dart';

abstract class FetchPokemon {
  Future<Either<Failure, PokemonEntity>> call(String name);
}

@LazySingleton(as: FetchPokemon)
class FetchPokemonImpl implements FetchPokemon {
  
  final PokemonRepository _repository;
  
  FetchPokemonImpl(this._repository)

  @override
  Future<Either<Failure, PokemonEntity>> call(String name) async {
    return await _repository.fetchPokemon(name);
  }
}
