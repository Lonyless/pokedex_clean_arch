import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_clean_arch/core/errors/server_exception.dart';
import 'package:pokedex_clean_arch/core/http/pokedex_http.dart';
import 'package:pokedex_clean_arch/modules/home/data/datasources/pokemon_datasource.dart';
import 'package:pokedex_clean_arch/modules/home/data/models/pokemon_base_model.dart';
import 'package:pokedex_clean_arch/modules/home/data/models/pokemon_model.dart';
import 'package:test/test.dart';

import 'pokemon_datasource_test.mocks.dart';

@GenerateMocks([PokedexHttp])
void main() {
  final mockPokedexHttp = MockPokedexHttp();
  final dataSource = PokemonDatasourceImpl(mockPokedexHttp);

  group(
    'fetchPokemonBaseList',
    () {
      test(
        'Deve retornar uma lista de [PokemonBaseModel] quando o client retorna os dados com sucesso',
        () async {
          when(
            mockPokedexHttp.get(any, queryParameteres: anyNamed('queryParameteres')),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              data: _pokemonBaseListFixture,
              statusCode: 200,
            ),
          );

          final result = await dataSource.fetchPokemonBaseList(1);

          final expected = [
            const PokemonBaseModel(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"),
            const PokemonBaseModel(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"),
            const PokemonBaseModel(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/3/"),
            const PokemonBaseModel(name: "charmander", url: "https://pokeapi.co/api/v2/pokemon/4/"),
          ];

          expect(listEquals(result, expected), isTrue);
        },
      );

      test(
        'Deve disparar uma [ServerException] quando o client retorna erro',
        () async {
          when(
            mockPokedexHttp.get(any, queryParameteres: anyNamed('queryParameteres')),
          ).thenThrow(DioException(
            requestOptions: RequestOptions(),
            response: Response(requestOptions: RequestOptions(), statusCode: 500),
          ));

          expect(
            () async => await dataSource.fetchPokemonBaseList(1),
            throwsA(isA<ServerException>()),
          );
        },
      );
    },
  );

  group(
    'fetchPokemon',
    () {
      test(
        'Deve retornar um [PokemonModel] quando o client retorna os dados com sucesso',
        () async {
          when(
            mockPokedexHttp.get(any, queryParameteres: anyNamed('queryParameteres')),
          ).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              data: _pokemonFixture,
              statusCode: 200,
            ),
          );

          final result = await dataSource.fetchPokemon('pidgeotto');

          final expected = PokemonModel(
            hp: 63,
            attack: 60,
            defense: 55,
            name: 'pidgeotto',
          );

          expect(result, expected);
        },
      );

      test(
        'Deve disparar uma [ServerException] quando o client retorna erro',
        () async {
          when(
            mockPokedexHttp.get(any, queryParameteres: anyNamed('queryParameteres')),
          ).thenThrow(DioException(
            requestOptions: RequestOptions(),
            response: Response(requestOptions: RequestOptions(), statusCode: 500),
          ));

          expect(
            () async => await dataSource.fetchPokemon('butterfree'),
            throwsA(isA<ServerException>()),
          );
        },
      );
    },
  );
}

final _pokemonBaseListFixture = {
  'results': [
    {"name": "bulbasaur", "url": "https://pokeapi.co/api/v2/pokemon/1/"},
    {"name": "ivysaur", "url": "https://pokeapi.co/api/v2/pokemon/2/"},
    {"name": "venusaur", "url": "https://pokeapi.co/api/v2/pokemon/3/"},
    {"name": "charmander", "url": "https://pokeapi.co/api/v2/pokemon/4/"},
  ]
};

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
