import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:pokedex_clean_arch/core/get_it.dart';
import 'package:pokedex_clean_arch/modules/home/data/models/pokemon_model.dart';
import 'package:pokedex_clean_arch/modules/home/presentation/store/search_pokemon_store.dart';
import 'package:pokedex_clean_arch/modules/home/presentation/widgets/search_button.dart';

import '../home_page_test.mocks.dart';

@GenerateMocks([SearchPokemonStore])
void main() {
  final mockSearchPokemonStore = MockSearchPokemonStore();

  testWidgets(
    'Deve buscar o pokemon',
    (tester) async {
      when(
        mockSearchPokemonStore.getPokemon(any),
      ).thenAnswer((_) async => Right(PokemonModel.fromMap(_pokemonFixture)));

      getIt.registerFactory<SearchPokemonStore>(() => mockSearchPokemonStore);

      tester.view.physicalSize = const Size(1400, 2080);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Material(
              child: SearchButton(),
            ),
          ),
        );

        await tester.pump();

        await tester.tap(find.byType(IconButton));

        await tester.pumpAndSettle();

        await tester.enterText(find.byType(TextField), 'pidgeotto');

        await tester.pumpAndSettle(const Duration(seconds: 1));
      });

      verify(mockSearchPokemonStore.getPokemon('pidgeotto')).called(1);
    },
  );
}

final _pokemonFixture = {
  "stats": [
    {
      "base_stat": 63,
      "effort": 0,
      "stat": {"name": "hp", "url": "https://pokeapi.co/api/v2/stat/1/"}
    },
    {
      "base_stat": 60,
      "effort": 0,
      "stat": {"name": "attack", "url": "https://pokeapi.co/api/v2/stat/2/"}
    },
    {
      "base_stat": 55,
      "effort": 0,
      "stat": {"name": "defense", "url": "https://pokeapi.co/api/v2/stat/3/"}
    },
  ],
  "species": {
    "name": "pidgeotto",
  },
};
