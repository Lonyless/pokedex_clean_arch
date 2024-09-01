import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_clean_arch/core/enum/api_request_state.dart';
import 'package:pokedex_clean_arch/core/failures/server_failure.dart';
import 'package:pokedex_clean_arch/modules/home/data/models/pokemon_base_model.dart';
import 'package:pokedex_clean_arch/modules/home/domain/usecases/fetch_pokemon_base_list.dart';
import 'package:pokedex_clean_arch/modules/home/presentation/store/home_store.dart';

import 'home_store_test.mocks.dart';

@GenerateMocks([FetchPokemonBaseList])
void main() {
  final mockFetchPokemonBaseList = MockFetchPokemonBaseList();
  final homeStore = HomeStore(mockFetchPokemonBaseList);

  test(
    'Deve chamar [FetchPokemonBaseList] apenas uma vez',
    () async {
      when(
        mockFetchPokemonBaseList.call(any),
      ).thenAnswer(
        (_) async => const Right([]),
      );

      await homeStore.fetch();

      verify(mockFetchPokemonBaseList.call(0)).called(1);
    },
  );

  test(
    'Deve preencher a lista de pokemons quando o [FetchPokemonBaseList] retorna [Right]',
    () async {
      when(
        mockFetchPokemonBaseList.call(any),
      ).thenAnswer(
        (_) async => const Right([
          PokemonBaseModel(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"),
          PokemonBaseModel(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"),
          PokemonBaseModel(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/3/"),
          PokemonBaseModel(name: "charmander", url: "https://pokeapi.co/api/v2/pokemon/4/"),
        ]),
      );

      await homeStore.fetch();

      expect(homeStore.apiRequestState, ApiRequestState.done);
      expect(homeStore.pokemonBaseList, isNotEmpty);
    },
  );

  test(
    'Deve emitir um estado de erro quando o [FetchPokemonBaseList] retorna [Left]',
    () async {
      when(
        mockFetchPokemonBaseList.call(any),
      ).thenAnswer(
        (_) async => Left(ServerFailure('Erro')),
      );

      await homeStore.fetch();

      expect(homeStore.apiRequestState, ApiRequestState.error);
    },
  );

  test(
    'Deve alterar a pagina',
    () {
      when(
        mockFetchPokemonBaseList.call(any),
      ).thenAnswer(
        (_) async => const Right([]),
      );

      homeStore.nextPage();
      homeStore.nextPage();

      expect(homeStore.pageNumber, 2);
    },
  );
}
