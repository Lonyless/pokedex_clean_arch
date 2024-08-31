import 'package:pokedex_clean_arch/modules/home/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({required super.hp, required super.attack, required super.defense, required super.name});

  factory PokemonModel.fromMap(Map<String, dynamic> data) {
    return PokemonModel(
      hp: data['stats'][0]['base_stat'],
      attack: data['stats'][1]['base_stat'],
      defense: data['stats'][2]['base_stat'],
      name: data['species']['name'],
    );
  }
}
