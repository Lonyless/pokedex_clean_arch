import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_clean_arch/core/enum/api_request_state.dart';
import 'package:pokedex_clean_arch/core/failures/failure.dart';
import 'package:pokedex_clean_arch/modules/home/domain/entities/pokemon_base_entity.dart';
import 'package:pokedex_clean_arch/modules/home/domain/repositories/pokemon_repository.dart';

part 'home_store.g.dart';

@injectable
class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeStoreBase(this._repository) {
    fetch();
  }

  PokemonRepository _repository;

  @observable
  List<PokemonBaseEntity> pokemonBaseList = [];

  @observable
  ApiRequestState apiRequestState = ApiRequestState.initial;

  @observable
  Failure? failure;

  @observable
  int pageNumber = 1;

  @action
  Future<void> fetch() async {
    apiRequestState = ApiRequestState.loading;

    final result = await _repository.fetchPokemonBaseList(pageNumber);

    result.fold(
      (l) {
        apiRequestState = ApiRequestState.error;
        failure = l;
      },
      (r) {
        apiRequestState = ApiRequestState.done;
        pokemonBaseList = r;
      },
    );
  }
}
