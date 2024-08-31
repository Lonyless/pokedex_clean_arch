import 'package:pokedex_clean_arch/modules/home/data/models/pokemon_base_model.dart';
import 'package:test/test.dart';

void main() {
  test(
    'fromMap deve retornar um [PokemonBaseModel] corretamente',
    () {
      final model = PokemonBaseModel.fromMap(_fixture);

      expect(model.name, 'bulbasaur');
      expect(model.url, 'https://pokeapi.co/api/v2/pokemon/1/');
    },
  );
}

final _fixture = {"name": "bulbasaur", "url": "https://pokeapi.co/api/v2/pokemon/1/"};
