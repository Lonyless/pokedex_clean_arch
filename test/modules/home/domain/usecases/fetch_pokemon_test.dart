import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_clean_arch/core/failures/server_failure.dart';
import 'package:pokedex_clean_arch/modules/home/data/models/pokemon_model.dart';
import 'package:pokedex_clean_arch/modules/home/domain/usecases/fetch_pokemon.dart';
import 'package:test/test.dart';

import 'fetch_pokemon_base_list_test.mocks.dart';

void main() {
  final mockPokemonRepository = MockPokemonRepository();
  final fetchPokemonImpl = FetchPokemonImpl(mockPokemonRepository);

  test(
    'Deve retornar [Right] quando o repository retorna os dados com sucesso',
    () async {
      when(
        mockPokemonRepository.fetchPokemon(any),
      ).thenAnswer(
        (_) async => Right(PokemonModel(hp: 65, attack: 15, defense: 80, name: 'venusaur')),
      );

      final result = await fetchPokemonImpl('pikachu');

      expect(result, isA<Right>());
    },
  );

  test(
    'Deve retornar [Left] quando o repository retorna erro',
    () async {
      when(
        mockPokemonRepository.fetchPokemon(any),
      ).thenAnswer(
        (_) async => Left(ServerFailure('Erro')),
      );

      final result = await fetchPokemonImpl('wartortle');

      expect(result, isA<Left>());
    },
  );
}
