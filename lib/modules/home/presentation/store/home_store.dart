import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_clean_arch/core/enum/api_request_state.dart';
import 'package:pokedex_clean_arch/core/failures/failure.dart';
import 'package:pokedex_clean_arch/modules/home/domain/entities/pokemon_base_entity.dart';
import 'package:pokedex_clean_arch/modules/home/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_clean_arch/modules/home/domain/usecases/fetch_pokemon_base_list.dart';

part 'home_store.g.dart';

@injectable
class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  FetchPokemonBaseList _useCase;

  HomeStoreBase(this._useCase) {
    fetch();
  }

  @observable
  ObservableList<PokemonBaseEntity> pokemonBaseList = ObservableList();

  @observable
  ApiRequestState apiRequestState = ApiRequestState.initial;

  @observable
  Failure? failure;

  @observable
  int pageNumber = 0;

  @action
  void nextPage() {
    pageNumber += 1;
    fetch();
  }

  @action
  Future<void> fetch() async {
    apiRequestState = ApiRequestState.loading;

    final result = await _useCase.fetchPokemonBaseList(pageNumber);

    result.fold(
      (l) {
        apiRequestState = ApiRequestState.error;
        failure = l;
      },
      (r) {
        apiRequestState = ApiRequestState.done;
        pokemonBaseList.addAll(ObservableList.of(r));
      },
    );
  }
}
