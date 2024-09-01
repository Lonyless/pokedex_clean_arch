import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:pokedex_clean_arch/core/get_it.dart';
import 'package:pokedex_clean_arch/modules/home/data/models/pokemon_base_model.dart';
import 'package:pokedex_clean_arch/modules/home/presentation/home_page.dart';
import 'package:pokedex_clean_arch/modules/home/presentation/store/home_store.dart';
import 'package:pokedex_clean_arch/modules/home/presentation/store/search_pokemon_store.dart';

import 'home_page_test.mocks.dart';

@GenerateMocks([HomeStore, SearchPokemonStore])
void main() {
  final mockHomeStore = MockHomeStore();
  final mockSearchPokemonStore = MockSearchPokemonStore();

  testWidgets(
    'Deve exibir a lista de pokemons corretamente',
    (tester) async {
      getIt.registerFactory<HomeStore>(() => mockHomeStore);
      getIt.registerFactory<SearchPokemonStore>(() => mockSearchPokemonStore);

      when(
        mockHomeStore.pokemonBaseList,
      ).thenAnswer(
        (_) => mobx.ObservableList.of([
          const PokemonBaseModel(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"),
          const PokemonBaseModel(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"),
          const PokemonBaseModel(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/3/"),
          const PokemonBaseModel(name: "charmander", url: "https://pokeapi.co/api/v2/pokemon/4/"),
        ]),
      );

      when(mockHomeStore.fetch()).thenAnswer((_) async {});

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Material(
              child: HomePage(),
            ),
          ),
        );
      });

      await tester.pump();

      expect(find.text('bulbasaur'), findsOneWidget);
      expect(find.text('ivysaur'), findsOneWidget);
      expect(find.text('venusaur'), findsOneWidget);
      expect(find.text('charmander'), findsOneWidget);
    },
  );
}
