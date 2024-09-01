import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_clean_arch/core/http/pokedex_http.dart';

import 'pokedex_http_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  final mockDio = MockDio();
  final pokedexHttp = PokedexHttp(mockDio);

  test(
    'Deve retornar uma [Response] corretamente',
    () async {
      when(
        mockDio.get(any),
      ).thenAnswer(
        (_) async => Response(requestOptions: RequestOptions()),
      );

      final response = await pokedexHttp.get('https://google.com');

      expect(response, isA<Response>());
    },
  );
}
