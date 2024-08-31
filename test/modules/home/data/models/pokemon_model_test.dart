import 'package:pokedex_clean_arch/modules/home/data/models/pokemon_model.dart';
import 'package:test/test.dart';

void main() {
  test(
    'fromMap deve retornar um [PokemonModel] corretamente',
    () {
      final model = PokemonModel.fromMap(_fixture);

      expect(model.name, 'charizard');
      expect(model.hp, 78);
      expect(model.attack, 84);
      expect(model.defense, 78);
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
