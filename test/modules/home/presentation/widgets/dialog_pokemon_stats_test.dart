import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:pokedex_clean_arch/modules/home/data/models/pokemon_model.dart';
import 'package:pokedex_clean_arch/modules/home/presentation/widgets/dialog_pokemon_stats.dart';

void main() {
  testWidgets(
    'Deve renderizar corretamente',
    (tester) async {
      tester.view.physicalSize = const Size(1400, 2080);

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Material(
              child: DialogPokemonStats(
                pokemon: PokemonModel.fromMap(_pokemonFixture),
              ),
            ),
          ),
        );
      });

      await tester.pump();

      expect(find.text("HP"), findsOneWidget);
      expect(find.text("Ataque"), findsOneWidget);
      expect(find.text("Defesa"), findsOneWidget);
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
