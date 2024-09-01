import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_clean_arch/core/failures/server_failure.dart';
import 'package:pokedex_clean_arch/modules/home/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_clean_arch/modules/home/domain/usecases/fetch_pokemon_base_list.dart';
import 'package:test/test.dart';

import 'fetch_pokemon_base_list_test.mocks.dart';

@GenerateMocks([PokemonRepository])
void main() {
  final mockPokemonRepository = MockPokemonRepository();
  final fetchPokemonBaseListImpl = FetchPokemonBaseListImpl(mockPokemonRepository);

  test(
    'Deve retornar [Right] quando o repository retorna os dados com sucesso',
    () async {
      when(
        mockPokemonRepository.fetchPokemonBaseList(any),
      ).thenAnswer((_) async => Right([]));

      final result = await fetchPokemonBaseListImpl(1);

      expect(result, isA<Right>());
    },
  );

  test(
    'Deve retornar [Left] quando o repository retorna erro',
    () async {
      when(
        mockPokemonRepository.fetchPokemonBaseList(any),
      ).thenAnswer((_) async => Left(ServerFailure('Erro')));

      final result = await fetchPokemonBaseListImpl(5);

      expect(result, isA<Left>());
    },
  );
}
