import 'package:pokedex_clean_arch/modules/home/domain/entities/pokemon_base_entity.dart';

class PokemonBaseModel extends PokemonBaseEntity {
  const PokemonBaseModel({
    required super.name,
    required super.url,
  });

  factory PokemonBaseModel.fromMap(Map<String, dynamic> data) {
    return PokemonBaseModel(
      name: data['name'],
      url: data['url'],
    );
  }
}
