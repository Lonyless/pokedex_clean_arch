import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_clean_arch/core/errors/server_exception.dart';
import 'package:pokedex_clean_arch/modules/home/data/datasources/pokemon_datasource.dart';
import 'package:pokedex_clean_arch/modules/home/data/models/pokemon_base_model.dart';
import 'package:pokedex_clean_arch/modules/home/data/models/pokemon_model.dart';
import 'package:pokedex_clean_arch/modules/home/data/repositories/pokemon_repository_impl.dart';
import 'package:test/test.dart';

import 'pokemon_repository_impl_test.mocks.dart';

@GenerateMocks([PokemonDatasource])
void main() {
  final mockpokemonDatasource = MockPokemonDatasource();
  final pokemonRepositoryImpl = PokemonRepositoryImpl(mockpokemonDatasource);

  group(
    'fetchPokemonBaseList',
    () {
      test(
        'Deve retornar [Right] quando o repository retorna os dados com sucesso',
        () async {
          when(
            mockpokemonDatasource.fetchPokemonBaseList(any),
          ).thenAnswer(
            (_) async => [
              const PokemonBaseModel(name: 'ditto', url: 'url'),
            ],
          );

          final result = await pokemonRepositoryImpl.fetchPokemonBaseList(1);

          expect(
            result,
            isA<Right>(),
          );
        },
      );

      test(
        'Deve retornar [Left] quando o repository retorna erro',
        () async {
          when(
            mockpokemonDatasource.fetchPokemonBaseList(any),
          ).thenThrow(
            ServerException(message: 'Erro', statusCode: 500),
          );

          final result = await pokemonRepositoryImpl.fetchPokemonBaseList(1);

          expect(
            result,
            isA<Left>(),
          );
        },
      );
    },
  );

  group(
    'fetchPokemon',
    () {
      test(
        'Deve retornar [Right] quando o repository retorna os dados com sucesso',
        () async {
          when(
            mockpokemonDatasource.fetchPokemon(any),
          ).thenAnswer(
            (_) async => PokemonModel(hp: 30, attack: 15, defense: 80, name: 'diglet'),
          );

          final result = await pokemonRepositoryImpl.fetchPokemon('diglet');

          expect(
            result,
            isA<Right>(),
          );
        },
      );

      test(
        'Deve retornar [Left] quando o repository retorna erro',
        () async {
          when(
            mockpokemonDatasource.fetchPokemon(any),
          ).thenThrow(
            ServerException(message: 'Erro', statusCode: 500),
          );

          final result = await pokemonRepositoryImpl.fetchPokemon('rattata');

          expect(
            result,
            isA<Left>(),
          );
        },
      );
    },
  );
}
