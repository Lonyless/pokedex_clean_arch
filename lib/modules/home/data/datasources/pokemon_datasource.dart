import 'package:injectable/injectable.dart';
import 'package:pokedex_clean_arch/core/adapters/request_send_adapter.dart';
import 'package:pokedex_clean_arch/core/errors/server_exception.dart';
import 'package:pokedex_clean_arch/core/http/pokedex_http.dart';
import 'package:pokedex_clean_arch/modules/home/data/models/pokemon_base_model.dart';
import 'package:pokedex_clean_arch/modules/home/data/models/pokemon_model.dart';
import 'package:pokedex_clean_arch/modules/home/domain/entities/pokemon_base_entity.dart';
import 'package:pokedex_clean_arch/modules/home/domain/entities/pokemon_entity.dart';

abstract class PokemonDatasource {
  Future<List<PokemonBaseEntity>> fetchPokemonBaseList(int pageNumber);
  Future<PokemonEntity> fetchPokemon(String name);
}

@LazySingleton(as: PokemonDatasource)
class PokemonDatasourceImpl implements PokemonDatasource {
  final PokedexHttp _client;

  PokemonDatasourceImpl(this._client);

  @override
  Future<List<PokemonBaseEntity>> fetchPokemonBaseList(int pageNumber) async {
    return await RequestSendAdapter.guard(() async {
      final response = await _client.get("https://pokeapi.co/api/v2/pokemon", queryParameteres: {
        'offset': pageNumber * 40,
        'limit': 40,
      });

      if (response.statusCode == 200 && response.data['results'] != null) {
        return response.data['results'].map<PokemonBaseModel>((e) => PokemonBaseModel.fromMap(e)).toList();
      } else {
        throw ServerException(message: "Erro ao buscar a lista de pokemons", statusCode: response.statusCode);
      }
    });
  }

  @override
  Future<PokemonEntity> fetchPokemon(String name) async {
    return await RequestSendAdapter.guard(() async {
      final response = await _client.get("https://pokeapi.co/api/v2/pokemon/$name");

      if (response.statusCode == 200) {
        return PokemonModel.fromMap(response.data);
      } else {
        throw ServerException(message: "Erro ao buscar pokemon", statusCode: response.statusCode);
      }
    });
  }
}
