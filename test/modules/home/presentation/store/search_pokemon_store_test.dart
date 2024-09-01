import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_clean_arch/core/failures/failure.dart';
import 'package:pokedex_clean_arch/modules/home/data/models/pokemon_model.dart';
import 'package:pokedex_clean_arch/modules/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_clean_arch/modules/home/domain/usecases/fetch_pokemon.dart';
import 'package:pokedex_clean_arch/modules/home/presentation/store/search_pokemon_store.dart';

import 'search_pokemon_store_test.mocks.dart';

@GenerateMocks([FetchPokemon])
void main() {
  final mockFetchPokemon = MockFetchPokemon();
  final searchPokemonStore = SearchPokemonStore(mockFetchPokemon);

  test(
    'Deve retornar um [PokemonModel] quando [FetchPokemon] retornar [Right]',
    () async {
      when(
        mockFetchPokemon.call(any),
      ).thenAnswer((_) async => Right(PokemonModel.fromMap(_fixture)));

      final result = await searchPokemonStore.getPokemon('ditto');

      final expected = PokemonModel(
        hp: 78,
        attack: 84,
        defense: 78,
        name: 'charizard',
      );

      expect(result, Right<Failure, PokemonEntity>(expected));
    },
  );
}

final _fixture = {
  "stats": [
    {
      "base_stat": 78,
      "effort": 0,
      "stat": {"name": "hp", "url": "https://pokeapi.co/api/v2/stat/1/"}
    },
    {
      "base_stat": 84,
      "effort": 0,
      "stat": {"name": "attack", "url": "https://pokeapi.co/api/v2/stat/2/"}
    },
    {
      "base_stat": 78,
      "effort": 0,
      "stat": {"name": "defense", "url": "https://pokeapi.co/api/v2/stat/3/"}
    },
  ],
  "species": {
    "name": "charizard",
  },
};
