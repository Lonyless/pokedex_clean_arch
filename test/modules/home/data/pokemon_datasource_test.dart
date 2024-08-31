import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_clean_arch/core/http/pokedex_http.dart';
import 'package:pokedex_clean_arch/modules/home/data/datasources/pokemon_datasource.dart';
import 'package:pokedex_clean_arch/modules/home/data/models/pokemon_base_model.dart';
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
              data: _resultsFixture,
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
    },
  );
}

final _resultsFixture = {
  'results': [
    {"name": "bulbasaur", "url": "https://pokeapi.co/api/v2/pokemon/1/"},
    {"name": "ivysaur", "url": "https://pokeapi.co/api/v2/pokemon/2/"},
    {"name": "venusaur", "url": "https://pokeapi.co/api/v2/pokemon/3/"},
    {"name": "charmander", "url": "https://pokeapi.co/api/v2/pokemon/4/"},
  ]
};
