import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_clean_arch/core/enum/api_request_state.dart';
import 'package:pokedex_clean_arch/core/failures/failure.dart';
import 'package:pokedex_clean_arch/modules/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_clean_arch/modules/home/domain/usecases/fetch_pokemon.dart';

part 'search_pokemon_store.g.dart';

@injectable
class SearchPokemonStore = SearchPokemonStoreBase with _$SearchPokemonStore;

abstract class SearchPokemonStoreBase with Store {
  final FetchPokemon _fetchPokemon;

  SearchPokemonStoreBase(this._fetchPokemon);

  @observable
  ApiRequestState apiRequestState = ApiRequestState.initial;

  @action
  Future<Either<Failure, PokemonEntity>> getPokemon(String name) async {
    try {
      apiRequestState = ApiRequestState.loading;
      return await _fetchPokemon.call(name);
    } finally {
      apiRequestState = ApiRequestState.done;
    }
  }
}
